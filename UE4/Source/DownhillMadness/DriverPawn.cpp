

#include "DownhillMadness.h"
#include "DriverPawn.h"


ADriverPawn::ADriverPawn(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->PhysicsConstraint = PCIP.CreateDefaultSubobject<UPhysicsConstraintComponent>(this, FName(TEXT("PhysicsConstraint")));
	this->PhysicsConstraint->ConstraintInstance.LinearXMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.LinearYMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.LinearZMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularSwing1Motion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularSwing2Motion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularTwistMotion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->bAbsoluteScale = true;
	this->PhysicsConstraint->AttachTo(this->FrontArrow);

	this->DriverMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("DriverMesh")));
	this->DriverMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->DriverMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->DriverMesh->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->DriverMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->DriverMesh->SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Block);
	this->DriverMesh->SetSimulatePhysics(true);
	this->DriverMesh->bAbsoluteScale = true;
	this->DriverMesh->AttachTo(this->RootComponent);

	this->CameraSpringArm = PCIP.CreateDefaultSubobject<USpringArmComponent>(this, FName(TEXT("CameraSpringArm")));
	this->CameraSpringArm->bUseControllerViewRotation = true;
	this->CameraSpringArm->TargetArmLength = 300.0f;
	this->CameraSpringArm->SocketOffset = FVector(0, 0, 70);
	this->CameraSpringArm->bDoCollisionTest = false;
	this->CameraSpringArm->AttachTo(this->DriverMesh);

	this->CharacterCamera = PCIP.CreateDefaultSubobject<UCameraComponent>(this, FName(TEXT("CharacterCamera")));
	this->CharacterCamera->AttachTo(this->CameraSpringArm, USpringArmComponent::SocketName);
	this->CharacterCamera->bUseControllerViewRotation = false;
	this->CharacterCamera->bAbsoluteLocation = true;
	this->CharacterCamera->bAbsoluteRotation = true;

	this->driverState = EDriverPawnState::PushingVehicle;
	this->steeringAxisInput = 0.0f;
	this->cameraStiffness = 60.0f;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void ADriverPawn::BeginPlay()
{
	Super::BeginPlay();
	this->anchor = this->DriverMesh->GetComponentLocation() - this->DriverMesh->GetForwardVector() * 200.0f + this->DriverMesh->GetUpVector() * 300.0f;
	this->oldRotation = this->DriverMesh->GetComponentRotation();
	this->oldLocation = this->DriverMesh->GetComponentLocation();
}


// ----------------------------------------------------------------------------


void ADriverPawn::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);

	this->anchor += this->DriverMesh->GetComponentLocation() - this->oldLocation;

	FRotator deltaRotation = this->DriverMesh->GetComponentRotation() - this->oldRotation;

	//this->anchor = this->DriverMesh->GetComponentLocation() + (this->anchor - this->DriverMesh->GetComponentLocation()).RotateAngleAxis(deltaRotation.Pitch, FVector(0, 1, 0));
	this->anchor = this->DriverMesh->GetComponentLocation() + (this->anchor - this->DriverMesh->GetComponentLocation()).RotateAngleAxis(deltaRotation.Yaw, FVector(0, 0, 1));

	FRotator rootRotation = this->DriverMesh->GetComponentRotation();

	FVector baseLocation = this->CharacterCamera->GetComponentLocation();
	FRotator baseRotation = this->CharacterCamera->GetComponentRotation();

	//FVector destLocation = this->DriverMesh->GetComponentLocation() - FRotator(FMath::ClampAngle(rootRotation.Pitch - 30, -80, -30), rootRotation.Yaw, 0).Vector() * 450.0f;
	FRotator destRotation = (this->DriverMesh->GetComponentLocation() - this->CharacterCamera->GetComponentLocation()).Rotation();

	FVector worldLocation = FMath::VInterpTo(baseLocation, anchor, DeltaSeconds, 4);// (anchor - baseLocation).Size() / 50.0f);
	FRotator worldRotation = FMath::RInterpTo(baseRotation, FRotator(destRotation.Pitch, destRotation.Yaw, 0), DeltaSeconds, 2);

	this->CharacterCamera->SetWorldLocation(worldLocation);
	this->CharacterCamera->SetWorldRotation(worldRotation);

	this->oldLocation = this->DriverMesh->GetComponentLocation();
	this->oldRotation = this->DriverMesh->GetComponentRotation();

	/*FRotator rootRotation = this->DriverMesh->GetComponentRotation();
	FRotator springArmRotation = this->CameraSpringArm->GetComponentRotation();
	float rootYaw = rootRotation.Yaw < 0.0f ? rootRotation.Yaw + 360.0f : rootRotation.Yaw;
	float springArmYaw = springArmRotation.Yaw < 0.0f ? springArmRotation.Yaw + 360.0f : springArmRotation.Yaw;
	float dist = rootYaw > springArmYaw ? rootYaw - springArmYaw : springArmYaw - rootYaw;

	float factor = 0.0f;

	if (dist > 180.0f)
	{
		factor = (rootYaw > springArmYaw) ? -(360.0f - dist) : (360.0f - dist);
	}
	else
	{
		factor = (rootYaw - springArmYaw);
	}
	this->AddControllerYawInput(factor / this->cameraStiffness);*/

	if (this->controlledVehicle != nullptr)
	{
		if (this->driverState == EDriverPawnState::JumpingIntoVehicle)
		{
			FTransform newTransform = this->controlledVehicle->Body->ComponentToWorld;
			newTransform.SetScale3D(this->DriverMesh->ComponentToWorld.GetScale3D());
			newTransform.SetLocation(newTransform.GetLocation() - newTransform.GetUnitAxis(EAxis::Z) * 50.0f);
			this->DriverMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
			this->DriverMesh->SetWorldTransform(newTransform);
			this->PhysicsConstraint->SetWorldTransform(this->controlledVehicle->Body->ComponentToWorld);
			this->PhysicsConstraint->AttachTo(this->controlledVehicle->Body, NAME_None, EAttachLocation::KeepWorldPosition);

			this->PhysicsConstraint->SetConstrainedComponents(this->DriverMesh, NAME_None, this->controlledVehicle->Body, NAME_None);
			this->PhysicsConstraint->bWantsInitializeComponent = true;
			this->PhysicsConstraint->InitializeComponent();

			this->DriverMesh->SetEnableGravity(true);

			this->driverState = EDriverPawnState::SteeringVehicle;
		}

		if (this->driverState == EDriverPawnState::SteeringVehicle)
		{
			this->controlledVehicle->SetSteeringInput(this->steeringAxisInput);
			this->controlledVehicle->SetBrakeInput(this->brakeAxisInput);
			this->controlledVehicle->UpdateControls(DeltaSeconds);
		}
	}
}


// ----------------------------------------------------------------------------


void ADriverPawn::SetupPlayerInputComponent(class UInputComponent* InputComponent)
{
	check(InputComponent);
	FInputAxisBinding binding;
	InputComponent->BindAxis("X Axis", this, &ADriverPawn::OnGetSteeringInput).bConsumeInput = false;
	InputComponent->BindAxis("Brakes", this, &ADriverPawn::OnGetBrakeInput).bConsumeInput = false;
	InputComponent->BindAction("DebugReset", EInputEvent::IE_Pressed, this, &ADriverPawn::OnDebugReset).bConsumeInput = false;
}


// ----------------------------------------------------------------------------


void ADriverPawn::OnGetSteeringInput(float axisInput)
{
	this->steeringAxisInput = axisInput;
}


// ----------------------------------------------------------------------------


void ADriverPawn::OnGetBrakeInput(float axisInput)
{
	this->brakeAxisInput = axisInput;
}


// ----------------------------------------------------------------------------


void ADriverPawn::OnDebugReset()
{
	if (GEngine)
	{
		FString levelName = this->GetWorld()->GetMapName();
		levelName.RemoveFromStart(FString(TEXT("UEDPIE_0_")), ESearchCase::CaseSensitive);
		this->OpenLevel(this, FName(*levelName), true, FString(TEXT("")));
	}
}


// ----------------------------------------------------------------------------


void ADriverPawn::OpenLevel(UObject* WorldContextObject, FName LevelName, bool bAbsolute, FString Options)
{
	UWorld* World = GEngine->GetWorldFromContextObject(WorldContextObject);
	const ETravelType TravelType = (bAbsolute ? TRAVEL_Absolute : TRAVEL_Relative);
	FWorldContext &WorldContext = GEngine->GetWorldContextFromWorldChecked(World);
	FString Cmd = LevelName.ToString();
	if (Options.Len() > 0)
	{
		Cmd += FString(TEXT("?")) + Options;
	}
	FURL TestURL(&WorldContext.LastURL, *Cmd, TravelType);
	if (TestURL.IsLocalInternal())
	{
		// make sure the file exists if we are opening a local file
		if (!GEngine->MakeSureMapNameIsValid(TestURL.Map))
		{
			UE_LOG(LogLevel, Warning, TEXT("WARNING: The map '%s' does not exist."), *TestURL.Map);
		}
	}

	GEngine->SetClientTravel(World, *Cmd, TravelType);
}


// ----------------------------------------------------------------------------


void ADriverPawn::SetVehicle(AVehicleBodyBase* vehicle)
{
	if (this->controlledVehicle == nullptr)
		this->controlledVehicle = vehicle;
}


// ----------------------------------------------------------------------------


void ADriverPawn::StartRace()
{
	this->driverState = EDriverPawnState::JumpingIntoVehicle;
}