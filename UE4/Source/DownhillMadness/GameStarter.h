

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleSpawnerLibrary.h"
#include "SpawnPoint.h"
#include "DriverSpectatorPawn.h"
#include "CustomGameViewportClient.h"
#include "GameStateStatics.h"
#include "TrackSplineComponent.h"
#include "GoalPodest.h"
#include "ResultsPawn.h"
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

	UPROPERTY(Category = GameStarter, BlueprintReadWrite, EditInstanceOnly)
	int32 currentTrack;

	UPROPERTY(Category = GameStarter, BlueprintReadWrite, EditInstanceOnly)
	ATrackSplineComponent* playerTracker;

	UPROPERTY(Category = GameStarter, BlueprintReadWrite, EditInstanceOnly)
	AGoalPodest* playersGoalPodest;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, EditDefaultsOnly)
	UMaterial* playerOneMaterial;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, EditDefaultsOnly)
	UMaterial* playerTwoMaterial;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, EditDefaultsOnly)
	UMaterial* playerThreeMaterial;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, EditDefaultsOnly)
	UMaterial* playerFourMaterial;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, EditDefaultsOnly)
	UClass* resultsHUDclass;

	//UPROPERTY(Category = GameStarter, BlueprintReadOnly, EditInstanceOnly)
	TArray<TKeyValuePair<float, uint8>> finishedPlayers;

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, EditInstanceOnly)
	bool raceOver;

	bool startingRace;
	bool timeRunning;
	TArray<ADriverPawn*> driverActors;

private:
	bool gameStarted;
	uint8 numberOfPlayers;
	TArray<FSerializedVehicle> vehicles;
	TArray<uint8> drivers;
	float startingRaceTime;

	void StartGameInternal(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers);
};
