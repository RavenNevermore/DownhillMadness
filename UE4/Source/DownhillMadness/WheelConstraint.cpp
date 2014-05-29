

#include "DownhillMadness.h"
#include "WheelConstraint.h"


UWheelConstraint::UWheelConstraint(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->steeringDegree = 0.0f;
}


// ----------------------------------------------------------------------------


void UWheelConstraint::UpdateWheel(UPrimitiveComponent* rigidBody, UPhysicsConstraintComponent* constraint, const FTransform& relativeWheelTransform, float steeringDegree)
{
	if (rigidBody == nullptr || constraint == nullptr)
		return;

	// Destroy old constraint so that wheel can be rotated freely
	if (FMath::Abs(steeringDegree - this->steeringDegree) >= 0.25f)
	{
		constraint->ConstraintInstance.TermConstraint();
	}

	// Backup angular direction and velocity
	float angularVelocity = rigidBody->GetPhysicsAngularVelocity().Size();
	FVector angularDirection = rigidBody->GetPhysicsAngularVelocity();

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
	FMatrix relativeWheelMatrix(relativeWheelTransform.GetUnitAxis(EAxis::X), relativeWheelTransform.GetUnitAxis(EAxis::Y), relativeWheelTransform.GetUnitAxis(EAxis::Z), FVector::ZeroVector);
	relativeWheelMatrix = relativeWheelMatrix.Inverse();

	FVector constraintRotatedForward = (relativeWheelMatrix.GetUnitAxis(EAxis::X).X * rigidBody->GetForwardVector())
		+ (relativeWheelMatrix.GetUnitAxis(EAxis::X).Y * rigidBody->GetRightVector())
		+ (relativeWheelMatrix.GetUnitAxis(EAxis::X).Z * rigidBody->GetUpVector());
	FVector constraintRotatedRight = rotationTransform.GetUnitAxis(EAxis::Y);
	FVector constraintRotatedUp = (relativeWheelMatrix.GetUnitAxis(EAxis::Z).X * rigidBody->GetForwardVector())
		+ (relativeWheelMatrix.GetUnitAxis(EAxis::Z).Y * rigidBody->GetRightVector())
		+ (relativeWheelMatrix.GetUnitAxis(EAxis::Z).Z * rigidBody->GetUpVector());

	constraintRotatedForward = constraintRotatedForward - constraintRotatedForward.ProjectOnTo(rotationTransform.GetUnitAxis(EAxis::Y));
	constraintRotatedUp = constraintRotatedUp - constraintRotatedUp.ProjectOnTo(rotationTransform.GetUnitAxis(EAxis::Y));
	constraintRotatedForward.Normalize();
	constraintRotatedUp.Normalize();

	FVector wheelForward = (relativeWheelTransform.GetUnitAxis(EAxis::X).X * constraintRotatedForward)
		+ (relativeWheelTransform.GetUnitAxis(EAxis::X).Y * constraintRotatedRight)
		+ (relativeWheelTransform.GetUnitAxis(EAxis::X).Z * constraintRotatedUp);
	FVector wheelRight = (relativeWheelTransform.GetUnitAxis(EAxis::Y).X * constraintRotatedForward)
		+ (relativeWheelTransform.GetUnitAxis(EAxis::Y).Y * constraintRotatedRight)
		+ (relativeWheelTransform.GetUnitAxis(EAxis::Y).Z * constraintRotatedUp);
	FVector wheelUp = (relativeWheelTransform.GetUnitAxis(EAxis::Z).X * constraintRotatedForward)
		+ (relativeWheelTransform.GetUnitAxis(EAxis::Z).Y * constraintRotatedRight)
		+ (relativeWheelTransform.GetUnitAxis(EAxis::Z).Z * constraintRotatedUp);

	FMatrix rotMatrix(wheelForward, wheelRight, wheelUp, FVector::ZeroVector);
	FRotator wheelRotation = rotMatrix.Rotator();

	// Nullify wheel rotation before rotating to prevent jumping
	rigidBody->SetPhysicsAngularVelocity(FVector::ZeroVector, false);

	// Set wheel rotation and location
	rigidBody->SetWorldLocationAndRotation(constraint->GetComponenTransform().GetLocation(), wheelRotation, false);
	rigidBody->BodyInstance.SetBodyTransform(rigidBody->ComponentToWorld, true);
	rigidBody->BodyInstance.UpdateBodyScale(rigidBody->ComponentToWorld.GetScale3D());

	// Reactivate wheel constraint to lock wheel rotation
	if (FMath::Abs(steeringDegree - this->steeringDegree) >= 0.25f)
		constraint->InitializeComponent();

	// Set wheel's new angular velocity
	rigidBody->SetPhysicsAngularVelocity(angularDirection, false);

	// Backup steering degree to prevent constraint from breaking every frame
	if (FMath::Abs(steeringDegree - this->steeringDegree) >= 0.25f)
	{
		this->steeringDegree = steeringDegree;
	}
}