

#include "DownhillMadness.h"
#include "VehicleWeightBase.h"


AVehicleWeightBase::AVehicleWeightBase(const class FPostConstructInitializeProperties& PCIP)
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

	this->WeightMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("WeightMesh")));
	this->WeightMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->WeightMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->WeightMesh->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->WeightMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->WeightMesh->AttachTo(this->RootComponent);
}


// ----------------------------------------------------------------------------


void AVehicleWeightBase::PrepareAttach()
{
	this->PhysicsConstraint->ResetRelativeTransform();

	this->relativeWeightTransform = this->WeightMesh->GetRelativeTransform();
}


