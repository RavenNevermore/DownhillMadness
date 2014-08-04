

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
	this->PhysicsConstraint->bAbsoluteScale = true;
	this->PhysicsConstraint->ConstraintInstance.bDisableCollision = true;
	this->PhysicsConstraint->AttachTo(this->FrontArrow);

	this->WheelConstraint = PCIP.CreateDefaultSubobject<UWheelConstraint>(this, FName(TEXT("WheelConstraint")));
	this->WheelConstraint->bAbsoluteScale = true;
	this->WheelConstraint->AttachTo(this->FrontArrow);

	this->AxisMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("AxisMesh")));
	this->AxisMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->AxisMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->AxisMesh->SetCollisionEnabled(ECollisionEnabled::QueryOnly);
	this->AxisMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->AxisMesh->SetSimulatePhysics(false);
	this->AxisMesh->bAbsoluteScale = true;
	this->AxisMesh->AttachTo(this->WheelConstraint);

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

	this->BrakeMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("BrakeMesh")));
	this->BrakeMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->BrakeMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->BrakeMesh->SetCollisionEnabled(ECollisionEnabled::QueryOnly);
	this->BrakeMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->BrakeMesh->SetSimulatePhysics(false);
	this->BrakeMesh->bAbsoluteScale = true;
	this->BrakeMesh->AttachTo(this->WheelConstraint);

	this->bIsSteerable = false;
	this->bHasBrake = true;
	this->isGrounded = false;
	this->isGroundedInternal = false;
	this->currentBrake = 0.0f;
	this->groundNormal = FVector::ZeroVector;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void AVehicleWheelBase::SetPartLocationAndRotation(FVector location, FRotator rotation)
{
	FTransform pivotTransform(rotation, location, FVector(1.0f, 1.0f, 1.0f));
	pivotTransform = FTransform(-pivotTransform.GetUnitAxis(EAxis::Y), pivotTransform.GetUnitAxis(EAxis::X), pivotTransform.GetUnitAxis(EAxis::Z), location);

	FMatrix pivotMatrix = this->SnapPivot->GetComponenTransform().ToMatrixNoScale();
	FMatrix rootMatrix = this->RootComponent->GetComponenTransform().ToMatrixNoScale();
	FMatrix relativeMatrix = rootMatrix * pivotMatrix.InverseSafe();

	FMatrix newRootMatrix = relativeMatrix * pivotTransform.ToMatrixNoScale();

	this->RootComponent->SetWorldLocationAndRotation(newRootMatrix.GetOrigin(), newRootMatrix.Rotator(), false);
}


// ----------------------------------------------------------------------------


void AVehicleWheelBase::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);

	if (this->isGroundedInternal)
		this->isGroundedInternal = false;
	else
	{
		this->isGrounded = false;
		this->currentBrake = 0.0f;
	}
}


// ----------------------------------------------------------------------------


void AVehicleWheelBase::PrepareAttach()
{
	this->PhysicsConstraint->ResetRelativeTransform();
	this->WheelConstraint->ResetRelativeTransform();

	UPrimitiveComponent* wheelCollider = this->GetRigidBody();
	if (wheelCollider != nullptr)
	{
		this->relativeWheelTransform = wheelCollider->GetRelativeTransform();
	}
}


// ----------------------------------------------------------------------------


void AVehicleWheelBase::BrakeWheel(float brakeValue)
{
	this->currentBrake = brakeValue;

	if (this->isGrounded)
	{
		UPrimitiveComponent* rigidBody = this->GetRigidBody();

		if (rigidBody == nullptr)
			return;

		FVector negativeVelocity = -(brakeValue * rigidBody->BodyInstance.GetUnrealWorldVelocity());
		FVector downVelocity = -(this->groundNormal * negativeVelocity.Size());
		rigidBody->AddImpulse(negativeVelocity, NAME_None, true);
		rigidBody->AddImpulse(downVelocity, NAME_None, true);
	}
}


// ----------------------------------------------------------------------------


UClass* AVehicleWheelBase::GetMeshWheelEquivalent()
{
	if (this->meshWheelCounterpart != nullptr)
		return this->meshWheelCounterpart;
	else
		return this->GetClass();
}


// ----------------------------------------------------------------------------


void AVehicleWheelBase::ReceiveHit(class UPrimitiveComponent* MyComp, class AActor* Other, class UPrimitiveComponent* OtherComp, bool bSelfMoved, FVector HitLocation, FVector HitNormal, FVector NormalImpulse, const FHitResult& Hit)
{
	Super::ReceiveHit(MyComp, Other, OtherComp, bSelfMoved, HitLocation, HitNormal, NormalImpulse, Hit);

	if (Hit.bBlockingHit/*OtherComp->GetCollisionObjectType() == ECC_WorldStatic*/)
	{
		this->isGrounded = true;
		this->isGroundedInternal = true;
		this->groundNormal = Hit.ImpactNormal;
	}
}