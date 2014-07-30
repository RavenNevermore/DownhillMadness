

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

	UPROPERTY()
	bool bIsFullscreen;

	UPROPERTY()
	int32 windowWidth;

	UPROPERTY()
	int32 windowHeight;

	UPROPERTY()
	uint8 antiAliasingQuality;

	UPROPERTY()
	uint8 graphicsQuality;

	UPROPERTY()
	float musicVolume;

	UPROPERTY()
	float soundVolume;

	UPROPERTY()
	float voicesVolume;
};
