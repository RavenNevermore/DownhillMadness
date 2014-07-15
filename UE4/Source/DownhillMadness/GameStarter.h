

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleSpawnerLibrary.h"
#include "SpawnPoint.h"
#include "DriverSpectatorPawn.h"
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
	void StartGame(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers);

	/**
	* @brief	Ends splitscreen
	*/
	UFUNCTION(BlueprintCallable, Category = "Actors|GameStart|GameStarter")
	void EndGame();

private:
	bool gameStarted;
	uint8 numberOfPlayers;
	TArray<FSerializedVehicle> vehicles;
	TArray<uint8> drivers;

	void StartGameInternal(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers);
};
