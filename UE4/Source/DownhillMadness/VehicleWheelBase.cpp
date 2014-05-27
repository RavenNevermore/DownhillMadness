

#include "DownhillMadness.h"
#include "VehicleWheelBase.h"


AVehicleWheelBase::AVehicleWheelBase(const class FPostConstructInitializeProperties& PCIP)
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
	this->PhysicsConstraint->ConstraintInstance.AngularSwing2Motion = EAngularConstraintMotion::ACM_Free;
	this->PhysicsConstraint->ConstraintInstance.AngularTwistMotion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->AttachTo(this->FrontArrow);

	this->WheelConstraint = PCIP.CreateDefaultSubobject<UWheelConstraint>(this, FName(TEXT("WheelConstraint")));
	this->WheelConstraint->AttachTo(this->FrontArrow);

	this->SetActorTickEnabled(true);

	this->bIsSteerable = false;
}


