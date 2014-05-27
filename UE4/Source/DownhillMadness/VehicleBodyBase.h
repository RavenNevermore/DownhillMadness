

#pragma once

#include "GameFramework/Actor.h"
#include "WheelConstraint.h"
#include "VehicleWheelBase.h"
#include "VehicleBodyBase.generated.h"

/**
 * @brief	Base class for vehicle bodies that manages and communicates with all other vehicle components
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (UWheelConstraint, AVehicleWheelBase, AVehicleWheelCapsuleBase, AVehicleWheelMeshBase, AVehicleBrakeBase, AVehicleSteeringBase), ShowCategories = ("Actors|CustomVehicle|VehicleBody"))
class AVehicleBodyBase : public AActor
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;

	/**
	* @brief	Attach wheel to vehicle body
	* @param	wheel		Wheel to attach body
	*/
	UFUNCTION(Category = "Physics,CustomVehicle,VehicleBody")
	void AttachWheel(AVehicleWheelBase* wheel);

	/**
	* @brief	Detach wheel from vehicle body
	* @param	wheel		Wheel to detach from body
	*/
	UFUNCTION(Category = "Physics,CustomVehicle,VehicleBody")
	void DetachWheel(AVehicleWheelBase* wheel);

	/** Body's mesh */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> Body;

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;
};
