

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

	this->WheelRaycastBase = PCIP.CreateDefaultSubobject<UBoxComponent>(this, FName(TEXT("WheelRaycastBase")));
	this->WheelRaycastBase->SetCollisionProfileName(FName(TEXT("Vehicle")));
	this->WheelRaycastBase->SetCollisionObjectType(ECollisionChannel::ECC_Vehicle);
	this->WheelRaycastBase->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->WheelRaycastBase->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->WheelRaycastBase->SetSimulatePhysics(false);
	this->WheelRaycastBase->InitBoxExtent(FVector(100.0f, 100.0f, 100.0f));
	this->WheelRaycastBase->AttachTo(this->Body);

	this->attachedSteering = nullptr;
	this->attachedBrake = nullptr;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
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
		if (currentWheel->bHasBrake)
			currentWheel->BrakeMesh->SetHiddenInGame(false);
		else
			currentWheel->BrakeMesh->SetHiddenInGame(true);
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


void AVehicleBodyBase::SetSteeringInput(float input)
{
	if (this->attachedSteering != nullptr)
		this->attachedSteering->SetInput(input);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::SetBrakeInput(float input)
{

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
