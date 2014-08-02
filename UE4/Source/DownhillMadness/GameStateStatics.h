

#pragma once

#include "GameFramework/Actor.h"
#include "Core.h"
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
	static void SetControllerIndexes(const TArray<uint8>& indexArray);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static TArray<uint8> GetControllerIndexes();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetSelectedCharacter(uint8 playerIndex, uint8 selectedCharacter);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static uint8 GetSelectedCharacter(uint8 playerIndex);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetSelectedVehicle(uint8 playerIndex, const FSerializedVehicle& vehicle);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static FSerializedVehicle GetSelectedVehicle(uint8 playerIndex);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetReloadMenu(bool reloadMenu);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool GetReloadMenu();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics", meta = (HidePin = "WorldContextObject", DefaultToSelf = "WorldContextObject"))
	static void StartNoSplitscreenMultiplayer(UObject* WorldContextObject);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void EndNoSplitscreenMultiplayer();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics", meta = (HidePin = "WorldContextObject", DefaultToSelf = "WorldContextObject"))
	static void StartWorkshopMultiplayer(UObject* WorldContextObject);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void EndWorkshopMultiplayer();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static float GetNearClipPlane();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static uint8 GetMaxVehicleSlots();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool GetRatatoskUnlocked();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static FString GetTrackRecordString(uint8 trackIndex);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static FString TrackTimeToString(float trackTime);
	
	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static TArray<FSerializedVehicle> GetWorkshopVehicles();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static TArray<FSerializedVehicle> GetAvailableVehicles();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics", meta = (HidePin = "WorldContextObject", DefaultToSelf = "WorldContextObject"))
	static TArray<AActor*> FindActorsOfType(UObject* WorldContextObject, UClass* targetActorClass);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool SaveGameData();

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool SaveTrackRecord(uint8 trackIndex, float trackRecord);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool SaveVehicle(AVehicleBodyBase* vehicle, uint8 slotIndex);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static bool SaveSerializedVehicle(const FSerializedVehicle& vehicle, uint8 slotIndex);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetViewportSettings(int32 NewSizeX, int32 NewSizeY, bool bIsFullscreen);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void GetViewportSettings(int32& SizeX, int32& SizeY, bool& bIsFullscreen);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetGameOptions(uint8 antiAliasingQuality, uint8 graphicsQuality, float musicVolume, float soundVolume, float voicesVolume);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void GetGameOptions(uint8& antiAliasingQuality, uint8& graphicsQuality, float& musicVolume, float& soundVolume, float& voicesVolume);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static void SetCameraBlendables(UCameraComponent* camera, const TArray<UObject*>& blendables);

	UFUNCTION(BlueprintCallable, Category = "GameStateStatics")
	static UObject* GetClassDefaultObject(UClass* inClass);

	static uint8 numberOfPlayers;
	static TArray<uint8> controllerIndexes;
	static TArray<uint8> selectedCharacters;
	static TArray<FSerializedVehicle> selectedVehicles;
	static bool bIsFullscreen;
	static int32 windowWidth;
	static int32 windowHeight;

private:
	static bool reloadMenu;
	static TArray<FSerializedVehicle> savedVehicles;
	static TArray<float> trackRecords;
	static TArray<bool> beatenRecords;
	static bool ratatoskUnlocked;
	static uint8 antiAliasingQuality;
	static uint8 graphicsQuality;
	static float musicVolume;
	static float soundVolume;
	static float voicesVolume;

	static const uint8 maxVehicleSlots = 16;

	static void LoadAllVehicles();
	static void LoadSavedGame();
};
