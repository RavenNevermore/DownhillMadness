

#pragma once

#include "Components/SceneComponent.h"
#include "WheelConstraint.generated.h"

/**
 * @brief	Class for turning a PhysicsConstraint into a WheelConstraint
 * Use seperate WheelConstraint instance for each wheel
 */
UCLASS(ClassGroup = Physics, dependson(ConstraintInstance), MinimalAPI, meta = (BlueprintSpawnableComponent), HideCategories = (Activation, "Components|Activation", Physics, Mobility), ShowCategories = ("Physics|Components|WheelConstraint"))
class UWheelConstraint : public USceneComponent
{
	GENERATED_UCLASS_BODY()

	/**
	  * @brief	Updates constraint and wheel according to steering degree
	  * @param	constraint	The PhysicsConstraint component
	  * @param	wheel		The wheel component (should be rigid body)
	  * @param	steeringDegree	The steering degree, relative to this WheelConstraint
	  */
	UFUNCTION(BlueprintCallable, Category = WheelConstraint)
	void UpdateWheel(UPhysicsConstraintComponent* constraint, UPrimitiveComponent* wheel, float steeringDegree);

	/**
	* @brief	Stop body physics - call on a single WheelConstraint before steering
	* @param	body	Body component
	*/
	UFUNCTION(BlueprintCallable, Category = WheelConstraint)
	void StopBody(UPrimitiveComponent* body);

	/**
	* @brief	Reenable body physics - call on a single WheelConstraint after steering
	* @param	body	Body component
	*/
	UFUNCTION(BlueprintCallable, Category = WheelConstraint)
	void MoveBody(UPrimitiveComponent* body);

	UPROPERTY(VisibleAnywhere, Category = WheelConstraint)
	float steeringDegree;	/**< Last steering degree, used to prevent problems with constraint */

	UPROPERTY(VisibleAnywhere, Category = WheelConstraint)
	FVector bodyAngularVelocity;	/**< Angular velocity of body before steering */

	UPROPERTY(VisibleAnywhere, Category = WheelConstraint)
	FVector bodyLinearVelocity;		/**< Linear velocity of body before steering */
};
