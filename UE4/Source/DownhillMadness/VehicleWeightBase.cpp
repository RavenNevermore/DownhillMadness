

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
	this->PhysicsConstraint->ConstraintInstance.bDisableCollision = true;
	this->PhysicsConstraint->AttachTo(this->FrontArrow);

	this->SnapPivot = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("SnapPivot")));
	this->SnapPivot->AttachTo(this->FrontArrow);

	this->SnapForward = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("SnapForward")));
	this->SnapForward->bAbsoluteScale = true;
	this->SnapForward->SetRelativeScale3D(FVector(0.6f, 0.6f, 0.6f));
	this->SnapForward->AttachTo(this->SnapPivot);

	this->SnapRight = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("SnapRight")));
	this->SnapRight->bAbsoluteScale = true;
	this->SnapRight->SetRelativeScale3D(FVector(0.6f, 0.6f, 0.6f));
	this->SnapRight->RelativeRotation.Yaw = 90.0f;
	this->SnapRight->SetArrowColor_New(FColor::Green);
	this->SnapRight->AttachTo(this->SnapPivot);

	this->WeightMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("WeightMesh")));
	this->WeightMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->WeightMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->WeightMesh->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->WeightMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->WeightMesh->AttachTo(this->RootComponent);
}


// ----------------------------------------------------------------------------


void AVehicleWeightBase::HidePart()
{
	this->WeightMesh->SetHiddenInGame(true, false);
	this->WeightMesh->SetVisibility(false, false);
}


// ----------------------------------------------------------------------------


void AVehicleWeightBase::ShowPart()
{
	this->WeightMesh->SetHiddenInGame(false, false);
	this->WeightMesh->SetVisibility(true, false);
}


// ----------------------------------------------------------------------------


void AVehicleWeightBase::PrepareAttach()
{
	this->PhysicsConstraint->ResetRelativeTransform();

	this->relativeWeightTransform = this->WeightMesh->GetRelativeTransform();
}


