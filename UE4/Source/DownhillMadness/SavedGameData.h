

#pragma once

#include "GameFramework/SaveGame.h"
#include "SavedGameData.generated.h"

/**
 * @brief	SaveGame for game data
 */
UCLASS()
class USavedGameData : public USaveGame
{
	GENERATED_UCLASS_BODY()

	UPROPERTY()
	TArray<float> trackRecords;

	UPROPERTY()
	TArray<bool> beatenRecords;

	UPROPERTY()
	uint32 ratatoskUnlocked: 1;
};
