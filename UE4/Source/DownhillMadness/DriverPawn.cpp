

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

	this->CameraSphere = PCIP.CreateDefaultSubobject<USphereComponent>(this, FName(TEXT("CameraSphere")));
	this->CameraSphere->AttachTo(this->FrontArrow);
	this->CameraSphere->RelativeLocation = FVector(0, 0, 70);
	this->CameraSphere->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->CameraSphere->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->CameraSphere->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->CameraSphere->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->CameraSphere->SetSimulatePhysics(true);
	this->CameraSphere->SetEnableGravity(false);
	this->CameraSphere->SetSphereRadius(10.0f, false);
	this->CameraSphere->bAbsoluteLocation = true;
	this->CameraSphere->bAbsoluteRotation = true;

	this->CharacterCamera = PCIP.CreateDefaultSubobject<UCameraComponent>(this, FName(TEXT("CharacterCamera")));
	this->CharacterCamera->AttachTo(this->CameraSphere);
	this->CharacterCamera->bUseControllerViewRotation = false;

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
	this->cameraAnchor = this->DriverMesh->GetComponentLocation() - this->DriverMesh->GetForwardVector() * 200.0f + this->DriverMesh->GetUpVector() * 300.0f;
	this->driverOldRotation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().Rotator();
	this->driverOldLocation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation();
}


// ----------------------------------------------------------------------------


void ADriverPawn::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);

	this->cameraAnchor += this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation() - this->driverOldLocation;

	FRotator deltaRotation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().Rotator() - this->driverOldRotation;

	//this->cameraAnchor = this->DriverMesh->GetComponentLocation() + (this->cameraAnchor - this->DriverMesh->GetComponentLocation()).RotateAngleAxis(deltaRotation.Pitch, FVector(0, 1, 0));
	this->cameraAnchor = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation() + (this->cameraAnchor - this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation()).RotateAngleAxis(deltaRotation.Yaw, FVector(0, 0, 1));

	FRotator rootRotation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().Rotator();

	FVector baseLocation = this->CameraSphere->BodyInstance.GetUnrealWorldTransform().GetLocation();
	FRotator baseRotation = this->CameraSphere->BodyInstance.GetUnrealWorldTransform().Rotator();

	//FVector destLocation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation() - FRotator(FMath::ClampAngle(rootRotation.Pitch - 30, -80, -30), rootRotation.Yaw, 0).Vector() * 450.0f;
	FRotator destRotation = (this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation() - this->CameraSphere->BodyInstance.GetUnrealWorldTransform().GetLocation()).Rotation();

	FVector worldLocation = FMath::VInterpTo(baseLocation, cameraAnchor, DeltaSeconds, 4);// (cameraAnchor - baseLocation).Size() / 50.0f);
	FRotator worldRotation = FMath::RInterpTo(baseRotation, FRotator(destRotation.Pitch, destRotation.Yaw, 0), DeltaSeconds, 2);

	//this->CharacterCamera->SetWorldLocation(worldLocation);
	//this->CharacterCamera->SetWorldRotation(worldRotation);	
	FTransform newCameraTransform(worldRotation, worldLocation, this->CameraSphere->BodyInstance.GetUnrealWorldTransform().GetScale3D());
	this->CameraSphere->BodyInstance.SetBodyTransform(newCameraTransform, false);

	this->driverOldLocation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation();
	this->driverOldRotation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().Rotator();


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