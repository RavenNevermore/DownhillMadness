

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

	void HidePart() OVERRIDE;
	void ShowPart() OVERRIDE;

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Arrow for visualizing snap pivot's forward vector */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> SnapForward;

	/** Arrow for visualizing snap pivot's right vector */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> SnapRight;

	/** Weight mesh */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> WeightMesh;

	/** Weight's physics constraint */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UPhysicsConstraintComponent> PhysicsConstraint;

	/** Pivot for snapping */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> SnapPivot;

	/** Weight's transform relative to root */
	UPROPERTY(Category = VehicleWeight, BlueprintReadOnly, VisibleAnywhere)
	FTransform relativeWeightTransform;

	/** Prepare weight for attaching to body */
	UFUNCTION(Category = "Physics|CustomVehicle|VehicleWeight")
	void PrepareAttach();
};
