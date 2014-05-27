

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
	this->Body->SetSimulatePhysics(true);
	this->Body->SetNotifyRigidBodyCollision(true);
	this->Body->bGenerateOverlapEvents = true;
	this->Body->AttachTo(this->FrontArrow);

	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::BeginPlay()
{

}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::AttachWheel(AVehicleWheelBase* wheel)
{
	UPrimitiveComponent* rigidBody = wheel->GetRigidBody();

	wheel->PhysicsConstraint->SetConstrainedComponents(rigidBody, FName(), this->Body, FName());
	wheel->PhysicsConstraint->bWantsInitializeComponent = true;
	wheel->PhysicsConstraint->InitializeComponent();

	wheel->PhysicsConstraint->AttachTo(this->Body);
	wheel->WheelConstraint->AttachTo(this->Body);

	rigidBody->SetSimulatePhysics(true);
}


// ----------------------------------------------------------------------------


void AVehicleBodyBase::DetachWheel(AVehicleWheelBase* wheel)
{
	UPrimitiveComponent* rigidBody = wheel->GetRigidBody();

	wheel->PhysicsConstraint->ConstraintInstance.TermConstraint();

	rigidBody->SetSimulatePhysics(false);

	wheel->PhysicsConstraint->DetachFromParent();
	wheel->WheelConstraint->DetachFromParent();
	wheel->PhysicsConstraint->AttachTo(this->FrontArrow);
	wheel->WheelConstraint->AttachTo(this->FrontArrow);
}


