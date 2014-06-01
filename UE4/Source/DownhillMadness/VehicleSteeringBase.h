

#pragma once

#include "GameFramework/Actor.h"
#include "VehiclePartBase.h"
#include "VehicleSteeringBase.generated.h"

/**
 * @brief	Base class for vehicle steering system to be used on vehicle body
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, ShowCategories = ("Actors|CustomVehicle|VehicleSteering"), DependsOn = (AVehiclePartBase))
class AVehicleSteeringBase : public AVehiclePartBase
{
	GENERATED_UCLASS_BODY()

	/**
	* @brief	Set axis input for steering system
	* @param	input		Axis input between -1.0f and 1.0f
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSteering")
	void SetInput(float input);

	/**
	* @brief	Calculate steering based on current input, delta time and max steering
	* @param	DeltaSeconds		Delta seconds since last framce
	* @returns	Returns current steering value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSteering")
	virtual float UpdateSteering(float DeltaSeconds);

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Steering mesh */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> SteeringMesh;

	/** The current axis input */
	UPROPERTY(VisibleAnywhere, Category = VehicleSteering, BlueprintReadOnly)
	float currentInput;

	/** The current steering value */
	UPROPERTY(VisibleAnywhere, Category = VehicleSteering, BlueprintReadWrite)
	float currentSteering;

	/** The maximum steering degree */
	UPROPERTY(EditDefaultsOnly, Category = VehicleSteering, BlueprintReadOnly)
	float maxSteeringDegree;

	/** Steering speed */
	UPROPERTY(EditDefaultsOnly, Category = VehicleSteering, BlueprintReadOnly)
	float steeringSpeed;

	/** Steering snap back speed */
	UPROPERTY(EditDefaultsOnly, Category = VehicleSteering, BlueprintReadOnly)
	float steeringSnapBackSpeed;
};
