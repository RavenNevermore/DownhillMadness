

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleSpawnerLibrary.h"
#include "SpawnPoint.h"
#include "DriverSpectatorPawn.h"
#include "CustomGameViewportClient.h"
#include "GameStateStatics.h"
#include "GameStarter.generated.h"

/**
 * @brief	Class for starting game
 */
UCLASS(ClassGroup = GameStart, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (ASpawnPoint, UVehicleSpawner), ShowCategories = ("Actors|GameStart|GameStarter"))
class AGameStarter : public AActor
{
	GENERATED_UCLASS_BODY()

	void Tick(float DeltaSeconds) OVERRIDE;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> Root;

	UPROPERTY(Category = GameStarter, BlueprintReadWrite, EditDefaultsOnly)
	TArray<UClass*> driverClasses;

	/**
	* @brief	Start current game
	* @param	numberOfPlayers	The number of players in this game
	* @param	vehicles	The vehicle for each player
	* @param	drivers	The driver index for each player*/
	UFUNCTION(BlueprintCallable, Category = "Actors|GameStart|GameStarter")
	void StartGame();

	/**
	* @brief	Ends splitscreen
	*/
	UFUNCTION(BlueprintCallable, Category = "Actors|GameStart|GameStarter")
	void EndGame();

	UFUNCTION(BlueprintImplementableEvent, Category = "Actors|GameStart|GameStarter")
	void RaceStarted();

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, VisibleInstanceOnly)
	TArray<uint8> rankingArray;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, VisibleInstanceOnly)
	TArray<float> progressArray;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, VisibleInstanceOnly)
	float currentRaceDuration;

	bool startingRace;
	bool timeRunning;

private:
	bool gameStarted;
	uint8 numberOfPlayers;
	TArray<FSerializedVehicle> vehicles;
	TArray<uint8> drivers;
	TArray<ADriverPawn*> driverActors;
	float startingRaceTime;

	void StartGameInternal(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers);
};
