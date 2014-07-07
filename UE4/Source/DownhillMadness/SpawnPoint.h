

#pragma once

#include "GameFramework/Actor.h"
#include "SpawnPoint.generated.h"

/**
 * @brief	Class representing a spawn point in level
 */
UCLASS(ClassGroup = GameStart, Blueprintable, BlueprintType, DefaultToInstanced, ShowCategories = ("Actors|GameStart|SpawnPoint"))
class ASpawnPoint : public AActor
{
	GENERATED_UCLASS_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> Root;
};
