

#pragma once

#include "GameFramework/Actor.h"
#include "WheelConstraint.h"
#include "VehiclePartBase.h"
#include "VehicleWheelBase.h"
#include "VehicleBodyBase.generated.h"

/**
 * @brief	Base class for vehicle bodies that manages and communicates with all other vehicle components
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (UWheelConstraint, AVehiclePartBase, AVehicleWheelBase, AVehicleWheelCapsuleBase, AVehicleWheelMeshBase, AVehicleBrakeBase, AVehicleSteeringBase), ShowCategories = ("Actors|CustomVehicle|VehicleBody"))
class AVehicleBodyBase : public AVehiclePartBase
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;
	void Tick(float DeltaSeconds) OVERRIDE;

	/**
	* @brief	Update controls of this vehicle
	* @param	DeltaSeconds		Delta time since previous frame
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void UpdateControls(float DeltaSeconds);

	/**
	* @brief	Attach wheel to vehicle body
	* @param	wheel		Wheel to attach body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AttachWheel(AVehicleWheelBase* wheel);

	/**
	* @brief	Detach wheel from vehicle body
	* @param	wheel		Wheel to detach from body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool DetachWheel(AVehicleWheelBase* wheel);

	/**
	* @brief	Attach weight to vehicle body
	* @param	weight		Weight to attach body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AttachWeight(AVehicleWeightBase* weight);

	/**
	* @brief	Detach weight from vehicle body
	* @param	weight		Weight to detach from body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool DetachWeight(AVehicleWeightBase* weight);

	/**
	* @brief	Attach steering system to vehicle body
	* @param	steering		Steering system to attach body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AttachSteering(AVehicleSteeringBase* steering);

	/**
	* @brief	Detach steering system from vehicle body
	* @param	steering		Steering system to detach from body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool DetachSteering(AVehicleSteeringBase* steering);

	/**
	* @brief	Set input for steering system
	* @param	input		Input value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void SetSteeringInput(float input);

	/**
	* @brief	Set input for brakes
	* @param	input		Input value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void SetBrakeInput(float input);

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

	/** Base for connecting wheels through raycast */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UBoxComponent> WheelRaycastBase;

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Array of attached wheels */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	TArray<AVehicleWheelBase*> attachedWheels;

	/** Array of attached weights */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	TArray<AVehicleWeightBase*> attachedWeights;

	/** Attached steering system */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	AVehicleSteeringBase* attachedSteering;

	/** Attached brake system */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	AVehicleBrakeBase* attachedBrake;
};
