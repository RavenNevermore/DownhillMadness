

#pragma once

#include "GameFramework/Actor.h"
#include "WheelConstraint.h"
#include "VehicleWheelBase.h"
#include "VehicleBodyBase.generated.h"

/**
 * @brief	Base class for vehicle bodies that manages and communicates with all other vehicle components
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (UWheelConstraint, AVehicleWheelBase, AVehicleWheelCapsuleBase, AVehicleWheelMeshBase, AVehicleBrakeBase, AVehicleSteeringBase), HideCategories = ("Transform"), ShowCategories = ("Actors|CustomVehicle|VehicleBody"))
class AVehicleBodyBase : public AActor
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;

	/**
	* @brief	Attach wheel to vehicle body
	* @param	wheel		Wheel to attach body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void AttachWheel(AVehicleWheelBase* wheel);

	/**
	* @brief	Detach wheel from vehicle body
	* @param	wheel		Wheel to detach from body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void DetachWheel(AVehicleWheelBase* wheel);

	/**
	* @brief	Enable physics on this body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void EnablePhysics();

	/**
	* @brief	Disable physics on this body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void DisablePhysics();

	/** Body's mesh */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> Body;

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Array of attached wheels */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	TArray<AVehicleWheelBase*> attachedWheels;
};
