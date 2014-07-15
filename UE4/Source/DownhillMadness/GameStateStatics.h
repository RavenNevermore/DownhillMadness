

#pragma once

#include "GameFramework/Actor.h"
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

private:
	static uint8 numberOfPlayers;
	static TArray<uint8> selectedCharacters;
	static bool reloadMenu;
};
