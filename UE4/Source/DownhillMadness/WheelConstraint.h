

#pragma once

#include "Components/SceneComponent.h"
#include "WheelConstraint.generated.h"

/**
 * @brief	Class for turning a PhysicsConstraint into a WheelConstraint
 * Use seperate WheelConstraint instance for each wheel
 */
UCLASS(HeaderGroup = Component, EditInlineNew, ClassGroup = Physics, Meta = (BlueprintSpawnableComponent), HideCategories = (Activation, "Components|Activation", Physics, Mobility, Rendering, LOD), ShowCategories = ("Physics|Components|WheelConstraint"))
class UWheelConstraint : public USceneComponent
{
	GENERATED_UCLASS_BODY()

	/**
	  * @brief	Updates constraint and wheel according to steering degree
	  * @param	constraint	The PhysicsConstraint component
	  * @param	wheel		The wheel component (should be rigid body)
	  * @param	relativeWheelTransform	Transform of wheel relative to 
	  * @param	steeringDegree	The steering degree, relative to this WheelConstraint
	  * @param	usingBrakes	Whether to use brakes on this wheel
	  */
	UFUNCTION(BlueprintCallable, Category = "Physics|Component|WheelConstraint")
	void UpdateWheel(UPrimitiveComponent* rigidBody, UPhysicsConstraintComponent* constraint, const FTransform& relativeWheelTransform, float steeringDegree, bool usingBrakes);

	/** Last steering degree, used to prevent problems with constraint */
	UPROPERTY(VisibleAnywhere, Category = WheelConstraint)
	float steeringDegree;

	/** Whether wheel is currently using brakes */
	UPROPERTY(VisibleAnywhere, Category = WheelConstraint)
	bool bIsUsingBrakes;
};
