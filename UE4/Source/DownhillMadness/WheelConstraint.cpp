

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

	if (FMath::Abs(steeringDegree - this->steeringDegree) >= 0.25f)
	{
		// Destroy old constraint so that wheel can be rotated freely
		constraint->ConstraintInstance.TermConstraint();

		// Backup linear and angular direction and velocity
		float angularVelocity = wheel->GetPhysicsAngularVelocity().Size();
		FVector angularDirection = wheel->GetPhysicsAngularVelocity();
		//float linearVelocity = wheel->GetPhysicsLinearVelocity().Size();
		FVector linearDirection = wheel->GetPhysicsLinearVelocity();

		// Get axes of PhysicsConstraint before rotation
		FVector constraintRight = constraint->GetRightVector();
		FVector constraintForward = constraint->GetForwardVector();

		// Calculate new rotation of PhysicsConstraint
		FRotator newRotation = this->GetComponenTransform().GetRotationV().Rotator();
		FTransform rotationTransform(newRotation);
		rotationTransform = FTransform(rotationTransform.GetUnitAxis(EAxis::X).RotateAngleAxis(steeringDegree, rotationTransform.GetUnitAxis(EAxis::Z)), rotationTransform.GetUnitAxis(EAxis::Y).RotateAngleAxis(steeringDegree, rotationTransform.GetUnitAxis(EAxis::Z)), rotationTransform.GetUnitAxis(EAxis::Z), FVector::ZeroVector);
		newRotation = rotationTransform.Rotator();
		constraint->SetWorldRotation(newRotation, true);

		// Set new angular velocity depending on new PhysicsConstraint rotation and old angular velocity
		if (FVector::DotProduct(constraintRight, angularDirection) < 0.0f)
			angularDirection = -rotationTransform.GetUnitAxis(EAxis::Y);
		else
			angularDirection = rotationTransform.GetUnitAxis(EAxis::Y);

		angularDirection.Normalize();
		angularDirection *= angularVelocity;

		// Set new linear velocity depending on new PhysicsConstraint rotation and old linear velocity
		//if (FVector::DotProduct(constraintForward, linearDirection) < 0.0f)
		//	linearDirection = -rotationTransform.GetUnitAxis(EAxis::X);
		//else
		//	linearDirection = rotationTransform.GetUnitAxis(EAxis::X);

		//linearDirection.Normalize();
		//linearDirection *= linearVelocity;

		// Calculate new wheel rotation
		FVector wheelForward = wheel->GetForwardVector() - wheel->GetForwardVector().ProjectOnTo(rotationTransform.GetUnitAxis(EAxis::Y));
		FVector wheelRight = wheel->GetRightVector() - wheel->GetRightVector().ProjectOnTo(rotationTransform.GetUnitAxis(EAxis::Y));
		FMatrix rotMatrix(wheelForward, wheelRight, -rotationTransform.GetUnitAxis(EAxis::Y), FVector::ZeroVector);
		FRotator wheelRotation = rotMatrix.Rotator();
		
		// Nullify wheel movement before rotating to prevent jumping
		wheel->SetPhysicsAngularVelocity(FVector::ZeroVector, false);
		wheel->SetPhysicsLinearVelocity(FVector::ZeroVector, false);

		// Set wheel rotation and location
		wheel->SetWorldRotation(wheelRotation);
		wheel->SetWorldLocation(constraint->GetComponenTransform().GetLocation());

		// Reactivate wheel constraint to lock wheel rotation
		constraint->InitializeComponent();

		// Set wheel's new angular and linear velocity
		wheel->SetPhysicsLinearVelocity(linearDirection, false);
		wheel->SetPhysicsAngularVelocity(angularDirection, false);

		this->steeringDegree = steeringDegree;
	}
}