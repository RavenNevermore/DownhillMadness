

#include "DownhillMadness.h"
#include "VehicleBodyBase.h"


AVehicleBodyBase::AVehicleBodyBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->Body = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("Body")));
	this->Body->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->Body->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->Body->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->Body->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Block);
	this->Body->SetSimulatePhysics(false);
	this->Body->SetNotifyRigidBodyCollision(true);
	this->Body->bGenerateOverlapEvents = true;
	this->Body->AttachTo(this->FrontArrow);

	this->RaycastBase = PCIP.CreateDefaultSubobject<UBoxComponent>(this, FName(TEXT("RaycastBase")));
	this->RaycastBase->SetCollisionProfileName(FName(TEXT("Vehicle")));
	this->RaycastBase->SetCollisionObjectType(ECollisionChannel::ECC_Vehicle);
	this->RaycastBase->SetCollisionEnabled(ECollisionEnabled::QueryOnly);
	this->RaycastBase->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->RaycastBase->SetSimulatePhysics(false);
	this->RaycastBase->SetNotifyRigidBodyCollision(true);
	this->RaycastBase->bGenerateOverlapEvents = true;
	this->RaycastBase->InitBoxExtent(FVector(100.0f, 100.0f, 100.0f));
	this->RaycastBase->AttachTo(this->Body);

	this->attachedSteering = nullptr;
	this->attachedBrake = nullptr;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


FVehicleErrorCheck::FVehicleErrorCheck()
{
	this->hasNoWheels = false;
	this->hasNoSteerableWheels = false;
	this->hasNoBrakesOnWheels = false;
	this->hasNoBrakes = false;
	this->hasNoSteeringSystem = false;
	this->noErrors = true;
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::BeginPlay()
{
	Super::BeginPlay();
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);

	for (TArray<AVehicleWheelBase*>::TIterator wheelIter(this->attachedWheels); wheelIter; ++wheelIter)
	{
		AVehicleWheelBase* currentWheel = *wheelIter;

		if (currentWheel->bHasBrake)
			currentWheel->BrakeMesh->SetHiddenInGame(false);
		else
			currentWheel->BrakeMesh->SetHiddenInGame(true);
	}
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::UpdateControls(float DeltaSeconds)
{
	float steeringDegree = 0.0f;
	if (this->attachedSteering != nullptr)
	{
		steeringDegree = this->attachedSteering->UpdateSteering(DeltaSeconds);
	}

	for (TArray<AVehicleWheelBase*>::TIterator wheelIter(this->attachedWheels); wheelIter; ++wheelIter)
	{
		AVehicleWheelBase* currentWheel = *wheelIter;

		if (currentWheel->bIsSteerable)
			currentWheel->WheelConstraint->UpdateWheel(currentWheel->GetRigidBody(), currentWheel->PhysicsConstraint, currentWheel->relativeWheelTransform, steeringDegree);
		else
			currentWheel->WheelConstraint->UpdateWheel(currentWheel->GetRigidBody(), currentWheel->PhysicsConstraint, currentWheel->relativeWheelTransform, 0.0f);

		if (currentWheel->bHasBrake)
		{
			float brakeValue = 0.0f;
			if (this->attachedBrake != nullptr)
			{
				brakeValue = this->attachedBrake->UpdateBrake(DeltaSeconds, currentWheel->currentBrake);
			}
			currentWheel->currentBrake = brakeValue;
			currentWheel->BrakeWheel(brakeValue);
		}
	}
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::AttachWheel(AVehicleWheelBase* wheel)
{
	if (wheel == nullptr)
		return false;

	UPrimitiveComponent* rigidBody = wheel->GetRigidBody();

	if (rigidBody == nullptr)
		return false;

	if (this->attachedWheels.Find(wheel) != INDEX_NONE)
		return false;

	wheel->PrepareAttach();

	wheel->PhysicsConstraint->AttachTo(this->Body, NAME_None, EAttachLocation::KeepWorldPosition);
	wheel->WheelConstraint->AttachTo(this->Body, NAME_None, EAttachLocation::KeepWorldPosition);

	wheel->PhysicsConstraint->SetConstrainedComponents(rigidBody, NAME_None, this->Body, NAME_None);
	wheel->PhysicsConstraint->bWantsInitializeComponent = true;
	wheel->PhysicsConstraint->InitializeComponent();

	rigidBody->SetSimulatePhysics(true);

	this->attachedWheels.Add(wheel);

	return true;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::DetachWheel(AVehicleWheelBase* wheel)
{
	if (wheel == nullptr)
		return false;

	UPrimitiveComponent* rigidBody = wheel->GetRigidBody();

	if (rigidBody == nullptr)
		return false;

	int32 wheelIndex = this->attachedWheels.Find(wheel);
	if (wheelIndex == INDEX_NONE)
		return false;

	wheel->WheelConstraint->UpdateWheel(rigidBody, wheel->PhysicsConstraint, wheel->relativeWheelTransform, 0.0f);

	this->attachedWheels.RemoveAtSwap(wheelIndex);

	wheel->PhysicsConstraint->ConstraintInstance.TermConstraint();

	rigidBody->SetSimulatePhysics(false);
	rigidBody->AttachTo(wheel->FrontArrow, NAME_None, EAttachLocation::KeepWorldPosition);
	rigidBody->bAbsoluteLocation = false;
	rigidBody->bAbsoluteRotation = false;

	wheel->PhysicsConstraint->DetachFromParent(true);
	wheel->WheelConstraint->DetachFromParent(true);
	wheel->FrontArrow->SetWorldTransform(wheel->WheelConstraint->GetComponenTransform());
	wheel->PhysicsConstraint->SetWorldTransform(wheel->WheelConstraint->GetComponenTransform());
	wheel->PhysicsConstraint->AttachTo(wheel->FrontArrow, NAME_None, EAttachLocation::KeepWorldPosition);
	wheel->WheelConstraint->AttachTo(wheel->FrontArrow, NAME_None, EAttachLocation::KeepWorldPosition);
	rigidBody->SetRelativeTransform(wheel->relativeWheelTransform);

	return true;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::AttachWeight(AVehicleWeightBase* weight)
{
	if (weight == nullptr)
		return false;

	if (this->attachedWeights.Find(weight) != INDEX_NONE)
		return false;

	weight->PrepareAttach();

	weight->PhysicsConstraint->AttachTo(this->Body, NAME_None, EAttachLocation::KeepWorldPosition);

	weight->PhysicsConstraint->SetConstrainedComponents(weight->WeightMesh, NAME_None, this->Body, NAME_None);
	weight->PhysicsConstraint->bWantsInitializeComponent = true;
	weight->PhysicsConstraint->InitializeComponent();

	weight->WeightMesh->SetSimulatePhysics(true);

	this->attachedWeights.Add(weight);

	return true;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::DetachWeight(AVehicleWeightBase* weight)
{
	if (weight == nullptr)
		return false;

	int32 weightIndex = this->attachedWeights.Find(weight);
	if (weightIndex == INDEX_NONE)
		return false;

	this->attachedWeights.RemoveAtSwap(weightIndex);

	weight->PhysicsConstraint->ConstraintInstance.TermConstraint();

	weight->WeightMesh->SetSimulatePhysics(false);
	weight->WeightMesh->AttachTo(weight->FrontArrow, NAME_None, EAttachLocation::KeepWorldPosition);
	weight->WeightMesh->bAbsoluteLocation = false;
	weight->WeightMesh->bAbsoluteRotation = false;

	weight->PhysicsConstraint->DetachFromParent(true);
	weight->FrontArrow->SetWorldTransform(weight->PhysicsConstraint->GetComponenTransform());
	weight->PhysicsConstraint->AttachTo(weight->FrontArrow, NAME_None, EAttachLocation::KeepWorldPosition);
	weight->WeightMesh->SetRelativeTransform(weight->relativeWeightTransform);

	return true;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::AttachSteering(AVehicleSteeringBase* steering)
{
	if (steering == nullptr || this->attachedSteering != nullptr)
		return false;

	steering->FrontArrow->AttachTo(this->Body, NAME_None, EAttachLocation::KeepWorldPosition);
	steering->FrontArrow->ResetRelativeTransform();

	this->attachedSteering = steering;

	return true;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::DetachSteering(AVehicleSteeringBase* steering)
{
	if (steering == nullptr || this->attachedSteering == nullptr)
		return false;

	steering->FrontArrow->DetachFromParent(true);

	this->attachedSteering = nullptr;

	return true;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::AttachBrake(AVehicleBrakeBase* brake)
{
	if (brake == nullptr || this->attachedBrake != nullptr)
		return false;

	this->attachedBrake = brake;

	return true;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::DetachBrake(AVehicleBrakeBase* brake)
{
	if (brake == nullptr || this->attachedBrake == nullptr)
		return false;

	this->attachedBrake = nullptr;

	return true;
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::SetSteeringInput(float input)
{
	if (this->attachedSteering != nullptr)
		this->attachedSteering->SetInput(input);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::SetBrakeInput(float input)
{
	if (this->attachedBrake != nullptr)
		this->attachedBrake->SetInput(input);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::EnablePhysics()
{
	this->Body->SetSimulatePhysics(true);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::DisablePhysics()
{
	this->Body->SetSimulatePhysics(false);
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::AlignWheel(AVehicleWheelBase* wheel, float minDistance, float maxDistance, FTransform& newTransform)
{
	FMatrix relativeMatrix = wheel->SnapPivot->GetRelativeTransform().ToMatrixNoScale();
	relativeMatrix = relativeMatrix.Inverse();

	bool allignedPart = this->AlignPart(wheel->SnapPivot->GetComponenTransform(), minDistance, maxDistance, newTransform);

	FVector newTransformLocation = newTransform.GetLocation() - (wheel->SnapPivot->RelativeLocation.X * wheel->FrontArrow->GetForwardVector())
		- (wheel->SnapPivot->RelativeLocation.Y * wheel->FrontArrow->GetRightVector())
		- (wheel->SnapPivot->RelativeLocation.Z * wheel->FrontArrow->GetUpVector());

	FVector newTransformForward = (relativeMatrix.GetUnitAxis(EAxis::X).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformRight = (relativeMatrix.GetUnitAxis(EAxis::Y).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformUp = (relativeMatrix.GetUnitAxis(EAxis::Z).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Z * newTransform.GetUnitAxis(EAxis::Z));

	newTransform = FTransform(newTransformForward, newTransformRight, newTransformUp, newTransformLocation);

	return allignedPart;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::AlignWeight(AVehicleWeightBase* weight, float minDistance, float maxDistance, FTransform& newTransform)
{
	FMatrix relativeMatrix = weight->SnapPivot->GetRelativeTransform().ToMatrixNoScale();
	relativeMatrix = relativeMatrix.Inverse();

	bool allignedPart = this->AlignPart(weight->SnapPivot->GetComponenTransform(), minDistance, maxDistance, newTransform);

	FVector newTransformLocation = newTransform.GetLocation() - (weight->SnapPivot->RelativeLocation.X * weight->FrontArrow->GetForwardVector())
		- (weight->SnapPivot->RelativeLocation.Y * weight->FrontArrow->GetRightVector())
		- (weight->SnapPivot->RelativeLocation.Z * weight->FrontArrow->GetUpVector());

	FVector newTransformForward = (relativeMatrix.GetUnitAxis(EAxis::X).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformRight = (relativeMatrix.GetUnitAxis(EAxis::Y).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformUp = (relativeMatrix.GetUnitAxis(EAxis::Z).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Z * newTransform.GetUnitAxis(EAxis::Z));

	newTransform = FTransform(newTransformForward, newTransformRight, newTransformUp, newTransformLocation);

	return allignedPart;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::AlignPart(const FTransform& inTransform, float minDistance, float maxDistance, FTransform& newTransform)
{
	newTransform = inTransform;

	TArray<FHitResult> hitResults;

	FVector rayStart = inTransform.GetLocation();
	FVector rayEnd = this->RaycastBase->GetComponentLocation();

	FCollisionQueryParams queryParams(false);
	queryParams.bFindInitialOverlaps = true;

	FCollisionResponseParams responseParams(ECollisionResponse::ECR_Overlap);

	this->GetWorld()->LineTraceMulti(hitResults, rayStart, rayEnd, ECollisionChannel::ECC_WorldDynamic, queryParams, responseParams);


	// Outer loop
	for (TArray<FHitResult>::TIterator hitResultIter(hitResults); hitResultIter; ++hitResultIter)
	{
		FHitResult currentHitResult = *hitResultIter;

		if (currentHitResult.Component.Get() == this->RaycastBase.Get())
		{
			rayEnd = rayStart + maxDistance * -(currentHitResult.ImpactNormal);
			this->GetWorld()->LineTraceMulti(hitResults, rayStart, rayEnd, ECollisionChannel::ECC_WorldDynamic, queryParams, responseParams);

			// Inner loop
			for (TArray<FHitResult>::TIterator innerHitResultIter(hitResults); innerHitResultIter; ++innerHitResultIter)
			{
				currentHitResult = *innerHitResultIter;

				if (currentHitResult.Component.Get() == this->RaycastBase.Get())
				{
					if ((rayStart - currentHitResult.ImpactPoint).Size() < minDistance || (rayStart - rayEnd).Size() < (currentHitResult.ImpactPoint - rayEnd).Size())
						return false;


					// Get new transform
					FVector forwardVector;
					FVector rightVector = -currentHitResult.ImpactNormal;
					FVector upVector = this->RaycastBase->GetUpVector();
					float dotProduct = FVector::DotProduct(upVector, rightVector);

					if (dotProduct < -0.75f)
						upVector = this->RaycastBase->GetForwardVector();
					else if (dotProduct > 0.75f)
						upVector = -this->RaycastBase->GetForwardVector();

					forwardVector = FVector::CrossProduct(rightVector, upVector);

					newTransform = FTransform(forwardVector, rightVector, upVector, rayStart);

					return true;
				}
			}

			return false;
		}
	}

	return false;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::SnapWheel(AVehicleWheelBase* wheel, FTransform& newTransform)
{
	FMatrix relativeMatrix = wheel->SnapPivot->GetRelativeTransform().ToMatrixNoScale();
	relativeMatrix = relativeMatrix.Inverse();

	bool snappedPart = this->SnapPart(wheel->SnapPivot->GetComponenTransform(), newTransform);

	FVector newTransformLocation = newTransform.GetLocation() - (wheel->SnapPivot->RelativeLocation.X * wheel->FrontArrow->GetForwardVector())
		- (wheel->SnapPivot->RelativeLocation.Y * wheel->FrontArrow->GetRightVector())
		- (wheel->SnapPivot->RelativeLocation.Z * wheel->FrontArrow->GetUpVector());

	FVector newTransformForward = (relativeMatrix.GetUnitAxis(EAxis::X).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformRight = (relativeMatrix.GetUnitAxis(EAxis::Y).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformUp = (relativeMatrix.GetUnitAxis(EAxis::Z).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Z * newTransform.GetUnitAxis(EAxis::Z));

	newTransform = FTransform(newTransformForward, newTransformRight, newTransformUp, newTransformLocation);

	return snappedPart;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::SnapWeight(AVehicleWeightBase* weight, FTransform& newTransform)
{
	FMatrix relativeMatrix = weight->SnapPivot->GetRelativeTransform().ToMatrixNoScale();
	relativeMatrix = relativeMatrix.Inverse();

	bool snappedPart = this->SnapPart(weight->SnapPivot->GetComponenTransform(), newTransform);

	FVector newTransformLocation = newTransform.GetLocation() - (weight->SnapPivot->RelativeLocation.X * weight->FrontArrow->GetForwardVector())
		- (weight->SnapPivot->RelativeLocation.Y * weight->FrontArrow->GetRightVector())
		- (weight->SnapPivot->RelativeLocation.Z * weight->FrontArrow->GetUpVector());

	FVector newTransformForward = (relativeMatrix.GetUnitAxis(EAxis::X).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::X).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformRight = (relativeMatrix.GetUnitAxis(EAxis::Y).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Y).Z * newTransform.GetUnitAxis(EAxis::Z));
	FVector newTransformUp = (relativeMatrix.GetUnitAxis(EAxis::Z).X * newTransform.GetUnitAxis(EAxis::X))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Y * newTransform.GetUnitAxis(EAxis::Y))
		+ (relativeMatrix.GetUnitAxis(EAxis::Z).Z * newTransform.GetUnitAxis(EAxis::Z));

	newTransform = FTransform(newTransformForward, newTransformRight, newTransformUp, newTransformLocation);

	return snappedPart;
}


// ----------------------------------------------------------------------------


bool AVehicleBodyBase::SnapPart(const FTransform& inTransform, FTransform& newTransform)
{
	newTransform = inTransform;

	TArray<FHitResult> hitResults;

	FVector rayStart = inTransform.GetLocation();
	FVector rayEnd = this->RaycastBase->GetComponentLocation();

	FCollisionQueryParams queryParams(false);
	queryParams.bFindInitialOverlaps = true;

	FCollisionResponseParams responseParams(ECollisionResponse::ECR_Overlap);

	this->GetWorld()->LineTraceMulti(hitResults, rayStart, rayEnd, ECollisionChannel::ECC_WorldDynamic, queryParams, responseParams);

	bool foundBox = false;
	FHitResult boxHitResult;
	for (TArray<FHitResult>::TIterator hitResultIter(hitResults); hitResultIter && !foundBox; ++hitResultIter)
	{
		FHitResult currentHitResult = *hitResultIter;

		if (currentHitResult.Component.Get() == this->RaycastBase.Get())
		{
			foundBox = true;
			boxHitResult = currentHitResult;
		}
	}

	if (foundBox && boxHitResult.ImpactPoint == FVector::ZeroVector)
	{
		FVector shiftDirection = (rayStart - rayEnd);
		shiftDirection.Normalize();
		rayStart = rayStart + (shiftDirection * 500000.0f);		// Kinda stupid, but can't think of anything better here...
		this->GetWorld()->LineTraceMulti(hitResults, rayStart, rayEnd, ECollisionChannel::ECC_WorldDynamic, queryParams, responseParams);
	}


	// Outer loop
	for (TArray<FHitResult>::TIterator hitResultIter(hitResults); hitResultIter; ++hitResultIter)
	{
		FHitResult currentHitResult = *hitResultIter;

		if (currentHitResult.Component.Get() == this->RaycastBase.Get())
		{
			rayStart = currentHitResult.ImpactPoint + currentHitResult.ImpactNormal;
			this->GetWorld()->LineTraceMulti(hitResults, rayStart, rayEnd, ECollisionChannel::ECC_WorldDynamic, queryParams, responseParams);

			// Inner loop
			for (TArray<FHitResult>::TIterator innerHitResultIter(hitResults); innerHitResultIter; ++innerHitResultIter)
			{
				currentHitResult = *innerHitResultIter;

				if (currentHitResult.Component.Get() == this->RaycastBase.Get())
				{
					FVector rightVector = -currentHitResult.ImpactNormal;

					// Get new transform
					FVector forwardVector;
					FVector upVector = this->RaycastBase->GetUpVector();
					float dotProduct = FVector::DotProduct(upVector, rightVector);

					if (dotProduct < -0.75f)
						upVector = this->RaycastBase->GetForwardVector();
					else if (dotProduct > 0.75f)
						upVector = -this->RaycastBase->GetForwardVector();

					forwardVector = FVector::CrossProduct(rightVector, upVector);

					newTransform = FTransform(forwardVector, rightVector, upVector, currentHitResult.ImpactPoint);

					return true;
				}
			}

			return false;
		}
	}

	return false;
}


// ----------------------------------------------------------------------------


FVehicleErrorCheck AVehicleBodyBase::CheckVehicleForErrors()
{
	FVehicleErrorCheck foundErrors;
	foundErrors.noErrors = true;

	if (this->attachedWheels.Num() <= 0)
		foundErrors.hasNoWheels = true;

	foundErrors.hasNoBrakesOnWheels = true;
	foundErrors.hasNoSteerableWheels = true;

	for (TArray<AVehicleWheelBase*>::TIterator wheelIter(this->attachedWheels); wheelIter; ++wheelIter)
	{
		AVehicleWheelBase* currentWheel = *wheelIter;

		if (currentWheel->bHasBrake)
			foundErrors.hasNoBrakesOnWheels = false;

		if (currentWheel->bIsSteerable)
			foundErrors.hasNoSteerableWheels = false;
	}

	if (this->attachedBrake == nullptr)
		foundErrors.hasNoBrakes = true;

	if (this->attachedSteering == nullptr)
		foundErrors.hasNoSteeringSystem = true;

	if (foundErrors.hasNoWheels || foundErrors.hasNoBrakesOnWheels || foundErrors.hasNoSteerableWheels || foundErrors.hasNoBrakes || foundErrors.hasNoSteeringSystem)
		foundErrors.noErrors = false;

	return foundErrors;
}
