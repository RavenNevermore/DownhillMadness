

#pragma once

#include "GameFramework/Actor.h"
#include "VehiclePartBase.h"
#include "VehicleWeightBase.generated.h"

/**
 * @brief	Base class for vehicle weights
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, ShowCategories = ("Actors|CustomVehicle|VehicleWeight"), DependsOn = (AVehiclePartBase))
class AVehicleWeightBase : public AVehiclePartBase
{
	GENERATED_UCLASS_BODY()

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Weight mesh */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> WeightMesh;

	/** Weight's physics constraint */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UPhysicsConstraintComponent> PhysicsConstraint;

	/** Weight's transform relative to root */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleAnywhere)
	FTransform relativeWeightTransform;

	/** Prepare weight for attaching to body */
	UFUNCTION(Category = "Physics|CustomVehicle|VehicleWeight")
	void PrepareAttach();
};
