

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleSpawner.h"
#include "SpawnPoint.h"
#include "GameStarter.generated.h"

/**
 * @brief	Class for starting game
 */
UCLASS(ClassGroup = GameStart, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (ASpawnPoint, UVehicleSpawner), ShowCategories = ("Actors|GameStart|GameStarter"))
class AGameStarter : public AActor
{
	GENERATED_UCLASS_BODY()

	UPROPERTY(Category = GameStarter, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> Root;

	UPROPERTY(Category = GameStarter, BlueprintReadWrite, EditDefaultsOnly)
	TArray<UClass*> driverClasses;

	/* Start current game */
	UFUNCTION(BlueprintCallable, Category = "Actors|GameStart|GameStarter")
	void StartGame(uint8 numberOfPlayers, const TArray<AVehicleSpawner*>& vehicles, const TArray<uint8>& drivers);
};
