

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

	
	
};
