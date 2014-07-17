

#pragma once

#include "GameFramework/Actor.h"
#include "Kismet/GameplayStatics.h"
#include "VehicleSpawnerLibrary.h"
#include "SavedVehicle.h"
#include "SavedGameData.h"
#include "GameStateStatics.generated.h"

/**
 * @brief	Function library for game state statics
 */
UCLASS(HeaderGroup = KismetLibrary, DependsOn = (AVehicleBodyBase, AVehicleWheelBase, AVehicleWeightBase, AVehicleBrakeBase, AVehicleSteeringBase))
class UGameStateStatics : public UBlueprintFunctionLibrary
{
	GENERATED_UCLASS_BODY()

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetNumberOfPlayers(uint8 numberOfPlayers);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static uint8 GetNumberOfPlayers();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetSelectedCharacter(uint8 playerIndex, uint8 selectedCharacter);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static uint8 GetSelectedCharacter(uint8 playerIndex);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetReloadMenu(bool reloadMenu);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool GetReloadMenu();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics", meta = (HidePin = "WorldContextObject", DefaultToSelf = "WorldContextObject"))
	static void StartNoSplitscreenMultiplayer(UObject* WorldContextObject);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void EndNoSplitscreenMultiplayer();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static float GetNearClipPlane();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static uint8 GetMaxVehicleSlots();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool GetRatatoskUnlocked();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool SaveGameData();

private:
	static uint8 numberOfPlayers;
	static TArray<uint8> selectedCharacters;
	static TArray<FSerializedVehicle> selectedVehicles;
	static bool reloadMenu;
	static TArray<FSerializedVehicle> workshopVehicles;
	static TArray<FSerializedVehicle> savedVehicles;
	static TArray<float> trackRecords;
	static TArray<bool> beatenRecords;
	static bool ratatoskUnlocked;

	static const uint8 maxVehicleSlots = 30;

	static void LoadAllVehicles();
	static void LoadSavedGame();
};
