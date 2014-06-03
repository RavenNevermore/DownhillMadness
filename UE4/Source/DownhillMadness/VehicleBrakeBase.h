

#pragma once

#include "GameFramework/Actor.h"
#include "VehiclePartBase.h"
#include "VehicleBrakeBase.generated.h"

/**
 * @brief	Base class for vehicle brakes to be used on a vehicle body
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, ShowCategories = ("Actors|CustomVehicle|VehicleBrake"), DependsOn = (AVehiclePartBase))
class AVehicleBrakeBase : public AVehiclePartBase
{
	GENERATED_UCLASS_BODY()

	/**
	* @brief	Set axis input for brakes
	* @param	input		Axis input between 0.0f and 1.0f
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBrake")
	void SetInput(float input);

	/**
	* @brief	Calculate brake based on current input, delta time and max brake
	* @param	DeltaSeconds		Delta seconds since last framce
	* @returns	Returns current brake value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBrake")
	virtual float UpdateBrake(float DeltaSeconds);

	/** The current axis input */
	UPROPERTY(VisibleAnywhere, Category = VehicleBrake, BlueprintReadOnly)
	float currentInput;

	/** The current brake value */
	UPROPERTY(VisibleAnywhere, Category = VehicleBrake, BlueprintReadWrite)
	float currentBrake;

	/** The maximum brake value */
	UPROPERTY(EditDefaultsOnly, Category = VehicleBrake, BlueprintReadOnly)
	float maxBrake;

	/** Brake speed */
	UPROPERTY(EditDefaultsOnly, Category = VehicleBrake, BlueprintReadOnly)
	float brakeSpeed;
};
