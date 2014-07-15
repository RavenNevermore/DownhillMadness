

#pragma once

#include "GameFramework/SaveGame.h"
#include "VehicleSpawnerLibrary.h"
#include "VehicleBodyBase.h"
#include "SavedVehicle.generated.h"

/**
 * @brief	SaveGame for vehicles
 */
UCLASS()
class USavedVehicle : public USaveGame
{
	GENERATED_UCLASS_BODY()

	UFUNCTION(BlueprintCallable, Category = "GameState|SaveGames|SavedVehicle")
	void SetVehicle(const FSerializedVehicle& vehicle);

	UFUNCTION(BlueprintCallable, Category = "GameState|SaveGames|SavedVehicle")
	void SetVehicleFromBody(AVehicleBodyBase* vehicle);

	UFUNCTION(BlueprintCallable, Category = "GameState|SaveGames|SavedVehicle")
	FSerializedVehicle GetVehicle();

private:
	UPROPERTY()
	TArray<uint8> vehicleData;
};
