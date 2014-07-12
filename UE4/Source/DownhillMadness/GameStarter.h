

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleSpawnerLibrary.h"
#include "SpawnPoint.h"
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

	/* Start current game */
	UFUNCTION(BlueprintCallable, Category = "Actors|GameStart|GameStarter")
	void StartGame(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers);

private:
	bool gameStarted;
	uint8 numberOfPlayers;
	TArray<FSerializedVehicle> vehicles;
	TArray<uint8> drivers;

	void StartGameInternal(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers);
};
