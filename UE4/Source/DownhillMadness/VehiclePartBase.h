

#pragma once

#include "GameFramework/Actor.h"
#include "VehiclePartBase.generated.h"

/**
 * @brief	Empty base class for all vehicle parts
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, ShowCategories = ("Actors|CustomVehicle|VehiclePart"))
class AVehiclePartBase : public AActor
{
	GENERATED_UCLASS_BODY()

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehiclePart")
	virtual void HidePart();

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehiclePart")
	virtual void ShowPart();

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehiclePart")
	virtual void SelectPart();

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehiclePart")
	virtual void DeselectPart();

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehiclePart")
	virtual void SetPartLocationAndRotation(FVector location, FRotator rotation);
};
