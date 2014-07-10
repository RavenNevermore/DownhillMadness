

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

	this->DriverSkeletalMesh = PCIP.CreateDefaultSubobject<USkeletalMeshComponent>(this, FName(TEXT("DriverSkeletalMesh")));
	this->DriverSkeletalMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->DriverSkeletalMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->DriverSkeletalMesh->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->DriverSkeletalMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->DriverSkeletalMesh->bAbsoluteScale = true;
	this->DriverSkeletalMesh->SetSimulatePhysics(false);
	this->DriverSkeletalMesh->SetEnableGravity(false);
	this->DriverSkeletalMesh->AttachTo(this->FrontArrow);

	this->DriverCapsule = PCIP.CreateDefaultSubobject<UCapsuleComponent>(this, FName(TEXT("DriverCapsule")));
	this->DriverCapsule->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->DriverCapsule->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->DriverCapsule->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->DriverCapsule->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->DriverCapsule->SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Block);
	this->DriverCapsule->SetSimulatePhysics(false);
	this->DriverCapsule->SetNotifyRigidBodyCollision(true);
	this->DriverCapsule->bGenerateOverlapEvents = true;
	this->DriverCapsule->SetCapsuleHalfHeight(43.0f);
	this->DriverCapsule->SetCapsuleRadius(13.0f);
	this->DriverCapsule->BodyInstance.bUpdateMassWhenScaleChanges = true;
	this->DriverCapsule->AttachTo(this->DriverSkeletalMesh);

	this->cameraAirDifference = FVector(0, 0, 70);

	this->CameraSphere = PCIP.CreateDefaultSubobject<USphereComponent>(this, FName(TEXT("CameraSphere")));
	this->CameraSphere->AttachTo(this->FrontArrow);
	this->CameraSphere->RelativeLocation = this->cameraAirDifference;
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
	this->brakeAxisInput = 0.0f;
	this->leaningXInputOld = 0.0f;
	this->leaningYInputOld = 0.0f;
	this->cameraStiffness = 60.0f;
	this->maxLeaningImpulse = 10000.0f;
	this->bRespawnRequested = false;
	this->touchedGround = false;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void ADriverPawn::BeginPlay()
{
	Super::BeginPlay();

	this->cameraAnchor = this->DriverCapsule->GetComponentLocation() - this->DriverCapsule->GetForwardVector() * 200.0f + this->DriverCapsule->GetUpVector() * 300.0f;
	this->driverOldRotation = this->DriverCapsule->BodyInstance.GetUnrealWorldTransform().Rotator();
	this->driverOldLocation = this->DriverCapsule->BodyInstance.GetUnrealWorldTransform().GetLocation();

	UPhysicalMaterial* PhysMaterial = this->DriverSkeletalMesh->GetBodySetup()->PhysMaterial;
	if (PhysMaterial == NULL && GEngine != NULL)
	{
		PhysMaterial = GEngine->DefaultPhysMaterial;
	}

	this->DriverCapsule->SetPhysMaterialOverride(PhysMaterial);
	this->DriverCapsule->BodyInstance.UpdateMassProperties();
	float massDifference = this->DriverSkeletalMesh->CalculateMass() / (this->DriverCapsule->CalculateMass() / this->DriverCapsule->BodyInstance.MassScale);
	this->DriverCapsule->BodyInstance.MassScale = massDifference;
	this->DriverCapsule->BodyInstance.UpdateMassProperties();

	this->checkpointTransform = this->DriverCapsule->BodyInstance.GetUnrealWorldTransform();
}


// ----------------------------------------------------------------------------


void ADriverPawn::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);


	// Is car standing on ground?
	bool onGround = false;

	TArray<FHitResult> hitResults;

	FVector rayStart = this->DriverSkeletalMesh->GetComponenTransform().GetLocation();
	FVector rayEnd = this->DriverSkeletalMesh->GetComponenTransform().GetLocation() - (this->DriverSkeletalMesh->GetComponenTransform().GetUnitAxis(EAxis::Z) * 75.0f);
	
	FCollisionQueryParams queryParams(false);
	queryParams.bFindInitialOverlaps = true;

	FCollisionObjectQueryParams objectQueryParams(ECollisionChannel::ECC_WorldStatic);

	this->GetWorld()->LineTraceMulti(hitResults, rayStart, rayEnd, queryParams, objectQueryParams);

	for (TArray<FHitResult>::TIterator hitResultIter(hitResults); hitResultIter && !onGround; ++hitResultIter)
	{
		FHitResult currentHitResult = *hitResultIter;
		if (currentHitResult.Component.Get()->GetCollisionObjectType() == ECollisionChannel::ECC_WorldStatic)
		{
			onGround = true;
			this->touchedGround = true;
			break;
		}
	}


	// Calculate camera movement
	this->cameraAnchor += this->DriverSkeletalMesh->GetComponenTransform().GetLocation() - this->driverOldLocation;

	FRotator deltaRotation = this->DriverSkeletalMesh->GetComponenTransform().Rotator() - this->driverOldRotation;

	//this->cameraAnchor = this->DriverMesh->GetComponentLocation() + (this->cameraAnchor - this->DriverMesh->GetComponentLocation()).RotateAngleAxis(deltaRotation.Pitch, FVector(0, 1, 0));
	this->cameraAnchor = this->DriverSkeletalMesh->GetComponenTransform().GetLocation() + (this->cameraAnchor - this->DriverSkeletalMesh->GetComponenTransform().GetLocation()).RotateAngleAxis(deltaRotation.Yaw, FVector(0, 0, 1));

	FRotator rootRotation = this->DriverSkeletalMesh->GetComponenTransform().Rotator();

	FVector baseLocation = this->CameraSphere->BodyInstance.GetUnrealWorldTransform().GetLocation();
	FRotator baseRotation = this->CameraSphere->BodyInstance.GetUnrealWorldTransform().Rotator();

	//FVector destLocation = this->DriverMesh->BodyInstance.GetUnrealWorldTransform().GetLocation() - FRotator(FMath::ClampAngle(rootRotation.Pitch - 30, -80, -30), rootRotation.Yaw, 0).Vector() * 450.0f;
	FRotator destRotation = (this->DriverSkeletalMesh->GetComponenTransform().GetLocation() - this->CameraSphere->BodyInstance.GetUnrealWorldTransform().GetLocation()).Rotation();

	FVector worldLocation = FMath::VInterpTo(baseLocation, cameraAnchor, DeltaSeconds, 4);// (cameraAnchor - baseLocation).Size() / 50.0f);
	FRotator worldRotation = FMath::RInterpTo(baseRotation, FRotator(destRotation.Pitch, destRotation.Yaw, 0), DeltaSeconds, 2);
	
	if (onGround || !(this->touchedGround))
		this->cameraAirDifference = worldLocation - this->DriverSkeletalMesh->GetComponenTransform().GetLocation();
	else
		worldLocation = this->DriverSkeletalMesh->GetComponenTransform().GetLocation() + this->cameraAirDifference;

	//this->CharacterCamera->SetWorldLocation(worldLocation);
	//this->CharacterCamera->SetWorldRotation(worldRotation);
	FTransform newCameraTransform;
	if (onGround || !(this->touchedGround))
		newCameraTransform = FTransform(worldRotation, worldLocation, this->CameraSphere->BodyInstance.GetUnrealWorldTransform().GetScale3D());
	else
		newCameraTransform = FTransform(baseRotation, worldLocation, this->CameraSphere->BodyInstance.GetUnrealWorldTransform().GetScale3D());
	this->CameraSphere->BodyInstance.SetBodyTransform(newCameraTransform, false);

	this->driverOldLocation = this->DriverSkeletalMesh->GetComponenTransform().GetLocation();
	this->driverOldRotation = this->DriverSkeletalMesh->GetComponenTransform().Rotator();


	if (this->controlledVehicle != nullptr)
	{
		// Character is mounting car?
		if (this->driverState == EDriverPawnState::JumpingIntoVehicle)
		{
			FTransform newTransform = this->controlledVehicle->Body->BodyInstance.GetUnrealWorldTransform();
			newTransform.SetScale3D(this->DriverSkeletalMesh->ComponentToWorld.GetScale3D());
			this->DriverSkeletalMesh->SetWorldTransform(newTransform);

			newTransform = this->controlledVehicle->Body->BodyInstance.GetUnrealWorldTransform();
			FVector capsulePos = newTransform.GetLocation() + (this->DriverCapsule->GetUnscaledCapsuleHalfHeight() * newTransform.GetUnitAxis(EAxis::Z));
			newTransform.SetLocation(capsulePos);
			this->DriverCapsule->AttachTo(this->FrontArrow, NAME_None, EAttachLocation::KeepWorldPosition);
			this->DriverCapsule->BodyInstance.SetBodyTransform(newTransform, true);
			this->DriverCapsule->SetWorldTransform(newTransform, false);
			this->DriverSkeletalMesh->AttachTo(this->controlledVehicle->Body, NAME_None, EAttachLocation::KeepWorldPosition);
			// TODO: Remove later
			this->DriverSkeletalMesh->SetWorldScale3D(FVector(2.5f, 2.5f, 2.5f));
			// ---
			this->PhysicsConstraint->SetWorldTransform(this->controlledVehicle->Body->ComponentToWorld);
			this->PhysicsConstraint->AttachTo(this->controlledVehicle->Body, NAME_None, EAttachLocation::KeepWorldPosition);

			this->PhysicsConstraint->SetConstrainedComponents(this->DriverCapsule, NAME_None, this->controlledVehicle->Body, NAME_None);
			this->PhysicsConstraint->bWantsInitializeComponent = true;
			this->PhysicsConstraint->InitializeComponent();

			this->DriverCapsule->SetSimulatePhysics(true);
			this->DriverCapsule->SetEnableGravity(true);

			this->checkpointTransform = this->controlledVehicle->Body->BodyInstance.GetUnrealWorldTransform();

			this->driverState = EDriverPawnState::SteeringVehicle;
		}

		// Character is controlling car?
		if (this->driverState == EDriverPawnState::SteeringVehicle)
		{
			this->LeanPlayer(this->leaningXInput, this->leaningYInput);
			this->controlledVehicle->SetSteeringInput(this->steeringAxisInput);
			this->controlledVehicle->SetBrakeInput(this->brakeAxisInput);
			this->controlledVehicle->UpdateControls(DeltaSeconds);

			if (this->hasTransformed)
			{
				this->controlledVehicle->EnablePhysics();
				this->hasTransformed = false;
			}

			if (this->bRespawnRequested)
			{
				this->controlledVehicle->DisablePhysics();

				this->controlledVehicle->Body->BodyInstance.SetLinearVelocity(FVector::ZeroVector, false);
				this->controlledVehicle->Body->BodyInstance.SetAngularVelocity(FVector::ZeroVector, false);
				this->checkpointTransform.SetScale3D(this->controlledVehicle->Body->BodyInstance.GetUnrealWorldTransform().GetScale3D());
				this->controlledVehicle->Body->BodyInstance.SetBodyTransform(this->checkpointTransform, true);
				this->controlledVehicle->Body->SetWorldLocationAndRotation(this->checkpointTransform.GetLocation(), this->checkpointTransform.GetRotation(), false);

				this->touchedGround = false;

				this->hasTransformed = true;

				this->bRespawnRequested = false;
			}

			// Leaning
			FVector capsuleTop = this->DriverCapsule->GetComponenTransform().GetLocation() + (this->DriverCapsule->GetScaledCapsuleHalfHeight() * this->DriverCapsule->GetComponenTransform().GetUnitAxis(EAxis::Z));
			FVector2D leaningVector(leaningXInput, leaningYInput);
			FVector capsuleHalfWorld = (capsuleTop - this->DriverCapsule->GetComponenTransform().GetLocation()).ProjectOnTo(FVector(0.0f, 0.0f, 1.0f));
			capsuleHalfWorld /= this->DriverCapsule->GetScaledCapsuleHalfHeight();
			if (leaningVector.Size() > 1.0f)
				leaningVector.Normalize();
			this->DriverCapsule->BodyInstance.AddImpulseAtPosition(FVector(0.0, 0.0, -1.0) * this->maxLeaningImpulse * leaningVector.Size() * FMath::Max(0.0f, capsuleHalfWorld.Z), capsuleTop);

			if (GEngine)
				GEngine->AddOnScreenDebugMessage(-1, -1.0f, FColor::Red, FString(TEXT("Leaning: ")) + FString::SanitizeFloat(this->maxLeaningImpulse * leaningVector.Size() * FMath::Max(0.0f, capsuleHalfWorld.Z)));
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
	InputComponent->BindAxis("Lean X", this, &ADriverPawn::OnGetLeanX).bConsumeInput = false;
	InputComponent->BindAxis("Lean Y", this, &ADriverPawn::OnGetLeanY).bConsumeInput = false;
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
	//if (GEngine)
	//{
	//	FString levelName = this->GetWorld()->GetMapName();
	//	levelName.RemoveFromStart(FString(TEXT("UEDPIE_0_")), ESearchCase::CaseSensitive);
	//	this->OpenLevel(this, FName(*levelName), true, FString(TEXT("")));
	//}
	
	if (this->controlledVehicle != nullptr)
	{
		//this->DriverCapsule->BodyInstance.SetLinearVelocity(FVector::ZeroVector, false);
		//this->DriverCapsule->BodyInstance.SetAngularVelocity(FVector::ZeroVector, false);
		//this->DriverCapsule->BodyInstance.SetBodyTransform(this->checkpointTransform, true);

		//for (TArray<AVehicleWheelBase*>::TIterator wheelIter(this->controlledVehicle->attachedWheels); wheelIter; ++wheelIter)
		//{
		//	AVehicleWheelBase* currentWheel = *wheelIter;

		//	currentWheel->GetRigidBody()->BodyInstance.SetLinearVelocity(FVector::ZeroVector, false);
		//	currentWheel->GetRigidBody()->BodyInstance.SetAngularVelocity(FVector::ZeroVector, false);
		//	currentWheel->GetRigidBody()->BodyInstance.SetBodyTransform(this->checkpointTransform, true);
		//}

		//for (TArray<AVehicleWeightBase*>::TIterator weightIter(this->controlledVehicle->attachedWeights); weightIter; ++weightIter)
		//{
		//	AVehicleWeightBase* currentWeight = *weightIter;

		//	currentWeight->WeightMesh->BodyInstance.SetLinearVelocity(FVector::ZeroVector, false);
		//	currentWeight->WeightMesh->BodyInstance.SetAngularVelocity(FVector::ZeroVector, false);
		//	currentWeight->WeightMesh->BodyInstance.SetBodyTransform(this->checkpointTransform, true);
		//}

		this->bRespawnRequested = true;
	}
}


// ----------------------------------------------------------------------------


void ADriverPawn::OnGetLeanX(float axisInput)
{
	this->leaningXInput = axisInput;
}


// ----------------------------------------------------------------------------


void ADriverPawn::OnGetLeanY(float axisInput)
{
	this->leaningYInput = axisInput;
}


// ----------------------------------------------------------------------------


void ADriverPawn::LeanPlayer(float leanX, float leanY)
{
	FTransform vehicleTransform = this->controlledVehicle->Body->BodyInstance.GetUnrealWorldTransform();

	FVector2D leanVector(leanX, leanY);
	if (leanVector.Size() > 1.0f)
		leanVector.Normalize();

	float leanXDegree = -(leanVector.X * 30.0f);
	float leanYDegree = -(leanVector.Y * 30.0f);

	FVector capsuleForward = vehicleTransform.GetUnitAxis(EAxis::X);
	FVector capsuleRight = vehicleTransform.GetUnitAxis(EAxis::Y);
	FVector capsuleUp = vehicleTransform.GetUnitAxis(EAxis::Z);

	capsuleForward = capsuleForward.RotateAngleAxis(leanXDegree, vehicleTransform.GetUnitAxis(EAxis::X));
	capsuleRight = capsuleRight.RotateAngleAxis(leanXDegree, vehicleTransform.GetUnitAxis(EAxis::X));
	capsuleUp = capsuleUp.RotateAngleAxis(leanXDegree, vehicleTransform.GetUnitAxis(EAxis::X));

	capsuleForward = capsuleForward.RotateAngleAxis(leanYDegree, vehicleTransform.GetUnitAxis(EAxis::Y));
	capsuleRight = capsuleRight.RotateAngleAxis(leanYDegree, vehicleTransform.GetUnitAxis(EAxis::Y));
	capsuleUp = capsuleUp.RotateAngleAxis(leanYDegree, vehicleTransform.GetUnitAxis(EAxis::Y));

	vehicleTransform = FTransform(capsuleForward, capsuleRight, capsuleUp, vehicleTransform.GetLocation());

	if (FMath::Abs(leanXDegree - this->leaningXInputOld) >= 1.0f || FMath::Abs(leanYDegree - this->leaningYInputOld) >= 1.0f)
	{
		this->PhysicsConstraint->ConstraintInstance.TermConstraint();
	}

	FVector capsulePos = vehicleTransform.GetLocation() + (this->DriverCapsule->GetScaledCapsuleHalfHeight() * vehicleTransform.GetUnitAxis(EAxis::Z));
	vehicleTransform.SetLocation(capsulePos);

	this->DriverCapsule->BodyInstance.SetBodyTransform(vehicleTransform, true);
	this->DriverCapsule->SetWorldTransform(vehicleTransform, false);

	if (FMath::Abs(leanXDegree - this->leaningXInputOld) >= 1.0f || FMath::Abs(leanYDegree - this->leaningYInputOld) >= 1.0f)
	{
		this->PhysicsConstraint->InitializeComponent();
	}

	if (FMath::Abs(leanXDegree - this->leaningXInputOld) >= 1.0f || FMath::Abs(leanYDegree - this->leaningYInputOld) >= 1.0f)
	{
		this->leaningXInputOld = leanXDegree;
		this->leaningYInputOld = leanYDegree;
	}
}


// ----------------------------------------------------------------------------


void ADriverPawn::OpenLevel(UObject* WorldContextObject, FName LevelName, bool bAbsolute, FString Options)
{
//	UWorld* World = GEngine->GetWorldFromContextObject(WorldContextObject);
//	const ETravelType TravelType = (bAbsolute ? TRAVEL_Absolute : TRAVEL_Relative);
//	FWorldContext &WorldContext = GEngine->GetWorldContextFromWorldChecked(World);
//	FString Cmd = LevelName.ToString();
//	if (Options.Len() > 0)
//	{
//		Cmd += FString(TEXT("?")) + Options;
//	}
//	FURL TestURL(&WorldContext.LastURL, *Cmd, TravelType);
//	if (TestURL.IsLocalInternal())
//	{
//		// make sure the file exists if we are opening a local file
//		if (!GEngine->MakeSureMapNameIsValid(TestURL.Map))
//		{
//			UE_LOG(LogLevel, Warning, TEXT("WARNING: The map '%s' does not exist."), *TestURL.Map);
//		}
//	}
//
//	GEngine->SetClientTravel(World, *Cmd, TravelType);
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