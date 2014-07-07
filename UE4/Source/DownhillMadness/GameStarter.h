

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleSpawner.h"
#include "SpawnPoint.h"
#include "GameStarter.generated.h"

/**
 * @brief	Class for starting game
 */
UCLASS(ClassGroup = GameStart, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (ASpawnPoint, UVehicleSpawner), ShowCategories = ("Actors|GameStart|GameStarter"))
class AGameStarter : public AActor
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> Root;

	/** Current number of players */
	UPROPERTY(Category = GameStarter, BlueprintReadWrite, EditInstanceOnly)
	uint8 numberOfPlayers;
};
