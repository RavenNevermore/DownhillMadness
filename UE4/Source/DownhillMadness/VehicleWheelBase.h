

#pragma once

#include "GameFramework/Actor.h"
#include "WheelConstraint.h"
#include "VehicleWheelBase.generated.h"

/**
 * @brief	Base class for vehicle wheels to be used on vehicle bodies
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DependsOn = (UWheelConstraint), DefaultToInstanced, ShowCategories = ("Actors|CustomVehicle|VehicleWheel"))
class AVehicleWheelBase : public AActor
{
	GENERATED_UCLASS_BODY()

	/**
	* @brief	Returns UPrimitiveComponent to serve as wheel's base to attach to vehicle body
	* @returns	Wheel's base primitive component
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics,CustomVehicle,VehicleWheel")
	virtual UPrimitiveComponent* GetRigidBody() PURE_VIRTUAL(AVehicleWheelBase::GetRigidBody, return nullptr;);

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Indicates whether this wheel can be steered or not */
	UPROPERTY(Category = VehicleWheel, EditInstanceOnly, BlueprintReadWrite)
	uint32 bIsSteerable: 1;

	/** Wheel's physics constraint */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UPhysicsConstraintComponent> PhysicsConstraint;

	/** Wheel's wheel constraint */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UWheelConstraint> WheelConstraint;
};
