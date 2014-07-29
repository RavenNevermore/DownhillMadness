

#pragma once

#include "GameFramework/GameMode.h"
#include "GameModeStartPosFinder.generated.h"

/**
 * @brief	Game mode for finding player starts
 */
UCLASS(Blueprintable, BlueprintType, DefaultToInstanced)
class AGameModeStartPosFinder : public AGameMode
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;
	virtual AActor* ChoosePlayerStart(AController* Player) OVERRIDE;

	int currentPlayerIndex;
};
