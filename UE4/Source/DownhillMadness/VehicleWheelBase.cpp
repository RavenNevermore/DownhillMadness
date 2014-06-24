

#include "DownhillMadness.h"
#include "VehicleWheelBase.h"


AVehicleWheelBase::AVehicleWheelBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->AxisArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("AxisArrow")));
	this->AxisArrow->bAbsoluteScale = true;
	this->AxisArrow->SetRelativeScale3D(FVector(0.6f, 0.6f, 0.6f));
	this->AxisArrow->RelativeRotation.Yaw = 90.0f;
	this->AxisArrow->SetArrowColor_New(FColor::Green);
	this->AxisArrow->AttachTo(this->FrontArrow);

	this->PhysicsConstraint = PCIP.CreateDefaultSubobject<UPhysicsConstraintComponent>(this, FName(TEXT("PhysicsConstraint")));
	this->PhysicsConstraint->ConstraintInstance.LinearXMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.LinearYMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.LinearZMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularSwing1Motion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularSwing2Motion = EAngularConstraintMotion::ACM_Free;
	this->PhysicsConstraint->ConstraintInstance.AngularTwistMotion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->bAbsoluteScale = true;
	this->PhysicsConstraint->AttachTo(this->FrontArrow);

	this->WheelConstraint = PCIP.CreateDefaultSubobject<UWheelConstraint>(this, FName(TEXT("WheelConstraint")));
	this->WheelConstraint->bAbsoluteScale = true;
	this->WheelConstraint->AttachTo(this->FrontArrow);

	this->AxisMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("AxisMesh")));
	this->AxisMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->AxisMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->AxisMesh->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->AxisMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->AxisMesh->SetSimulatePhysics(false);
	this->AxisMesh->bAbsoluteScale = true;
	this->AxisMesh->AttachTo(this->WheelConstraint);

	this->BrakeMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("BrakeMesh")));
	this->BrakeMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->BrakeMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->BrakeMesh->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->BrakeMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->BrakeMesh->SetSimulatePhysics(false);
	this->BrakeMesh->bAbsoluteScale = true;
	this->BrakeMesh->AttachTo(this->WheelConstraint);

	this->bIsSteerable = false;
	this->bHasBrake = true;
	this->isGrounded = false;
	this->isGroundedInternal = false;
	this->currentBrake = 0.0f;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
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
		FVector downVelocity = -(this->PhysicsConstraint->GetUpVector() * negativeVelocity.Size());
		rigidBody->AddImpulse(negativeVelocity, NAME_None, true);
		rigidBody->AddImpulse(downVelocity, NAME_None, true);
	}
}


// ----------------------------------------------------------------------------


void AVehicleWheelBase::ReceiveHit(class UPrimitiveComponent* MyComp, class AActor* Other, class UPrimitiveComponent* OtherComp, bool bSelfMoved, FVector HitLocation, FVector HitNormal, FVector NormalImpulse, const FHitResult& Hit)
{
	Super::ReceiveHit(MyComp, Other, OtherComp, bSelfMoved, HitLocation, HitNormal, NormalImpulse, Hit);

	if (OtherComp->GetCollisionObjectType() == ECC_WorldStatic)
	{
		this->isGrounded = true;
		this->isGroundedInternal = true;
	}
}