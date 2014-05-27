

#include "DownhillMadness.h"
#include "WheelConstraint.h"


UWheelConstraint::UWheelConstraint(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->steeringDegree = 0.0f;
}


// ----------------------------------------------------------------------------


void UWheelConstraint::UpdateWheel(UPhysicsConstraintComponent* constraint, UPrimitiveComponent* wheel, float steeringDegree)
{
	if (constraint == nullptr || wheel == nullptr)
		return;

	// Destroy old constraint so that wheel can be rotated freely
	if (FMath::Abs(steeringDegree - this->steeringDegree) >= 0.25f)
	{
		constraint->ConstraintInstance.TermConstraint();
	}

	// Backup angular direction and velocity
	float angularVelocity = wheel->GetPhysicsAngularVelocity().Size();
	FVector angularDirection = wheel->GetPhysicsAngularVelocity();

	// Get axis of PhysicsConstraint before rotation
	FVector constraintRight = constraint->GetRightVector();

	// Calculate new rotation of PhysicsConstraint
	FRotator newRotation = this->GetComponenTransform().GetRotationV().Rotator();
	FTransform rotationTransform(newRotation);
	rotationTransform = FTransform(rotationTransform.GetUnitAxis(EAxis::X).RotateAngleAxis(steeringDegree, rotationTransform.GetUnitAxis(EAxis::Z)), rotationTransform.GetUnitAxis(EAxis::Y).RotateAngleAxis(steeringDegree, rotationTransform.GetUnitAxis(EAxis::Z)), rotationTransform.GetUnitAxis(EAxis::Z), FVector::ZeroVector);
	newRotation = rotationTransform.Rotator();
	constraint->SetWorldRotation(newRotation, false);

	// Set new angular velocity depending on new PhysicsConstraint rotation and old angular velocity
	if (FVector::DotProduct(constraintRight, angularDirection) < 0.0f)
		angularDirection = -rotationTransform.GetUnitAxis(EAxis::Y);
	else
		angularDirection = rotationTransform.GetUnitAxis(EAxis::Y);

	angularDirection.Normalize();
	angularDirection *= angularVelocity;

	// Calculate new wheel rotation
	FVector wheelForward = wheel->GetForwardVector() - wheel->GetForwardVector().ProjectOnTo(rotationTransform.GetUnitAxis(EAxis::Y));
	FVector wheelRight = wheel->GetRightVector() - wheel->GetRightVector().ProjectOnTo(rotationTransform.GetUnitAxis(EAxis::Y));
	wheelForward.Normalize();
	wheelRight.Normalize();
	FMatrix rotMatrix(wheelForward, wheelRight, -rotationTransform.GetUnitAxis(EAxis::Y), FVector::ZeroVector);
	FRotator wheelRotation = rotMatrix.Rotator();

	// Nullify wheel rotation before rotating to prevent jumping
	wheel->SetPhysicsAngularVelocity(FVector::ZeroVector, false);

	// Set wheel rotation and location
	wheel->SetWorldLocationAndRotation(constraint->GetComponenTransform().GetLocation(), wheelRotation, false);
	wheel->BodyInstance.SetBodyTransform(wheel->ComponentToWorld, true);
	wheel->BodyInstance.UpdateBodyScale(wheel->ComponentToWorld.GetScale3D());

	// Reactivate wheel constraint to lock wheel rotation
	if (FMath::Abs(steeringDegree - this->steeringDegree) >= 0.25f)
		constraint->InitializeComponent();

	// Set wheel's new angular velocity
	wheel->SetPhysicsAngularVelocity(angularDirection, false);

	// Backup steering degree to prevent constraint from breaking every frame
	if (FMath::Abs(steeringDegree - this->steeringDegree) >= 0.25f)
	{
		this->steeringDegree = steeringDegree;
	}
}