

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

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::BeginPlay()
{
	//Super::BeginPlay();
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::Tick(float DeltaSeconds)
{
	//Super::Tick(DeltaSeconds);

	for (TArray<AVehicleWheelBase*>::TIterator wheelIter(this->attachedWheels); wheelIter; ++wheelIter)
	{
		AVehicleWheelBase* currentWheel = *wheelIter;
		if (currentWheel->bIsSteerable)
			currentWheel->WheelConstraint->UpdateWheel(currentWheel->GetRigidBody(), currentWheel->PhysicsConstraint, currentWheel->relativeWheelTransform, 30.0f);
	}
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::AttachWheel(AVehicleWheelBase* wheel)
{
	if (wheel == nullptr)
		return;

	UPrimitiveComponent* rigidBody = wheel->GetRigidBody();

	if (rigidBody == nullptr)
		return;

	if (this->attachedWheels.Find(wheel) != INDEX_NONE)
		return;

	wheel->PrepareAttach();

	wheel->PhysicsConstraint->SetConstrainedComponents(rigidBody, NAME_None, this->Body, NAME_None);
	wheel->PhysicsConstraint->bWantsInitializeComponent = true;
	wheel->PhysicsConstraint->InitializeComponent();

	wheel->PhysicsConstraint->AttachTo(this->Body, NAME_None, EAttachLocation::KeepWorldPosition);
	wheel->WheelConstraint->AttachTo(this->Body, NAME_None, EAttachLocation::KeepWorldPosition);

	rigidBody->SetSimulatePhysics(true);

	this->attachedWheels.Add(wheel);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::DetachWheel(AVehicleWheelBase* wheel)
{
	if (wheel == nullptr)
		return;

	UPrimitiveComponent* rigidBody = wheel->GetRigidBody();

	if (rigidBody == nullptr)
		return;

	int32 wheelIndex = this->attachedWheels.Find(wheel);
	if (wheelIndex == INDEX_NONE)
		return;

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

	this->attachedWheels.RemoveAtSwap(wheelIndex);
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
