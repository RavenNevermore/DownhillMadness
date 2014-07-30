

#pragma once

#include "Engine/GameViewportClient.h"
#include "CustomGameViewportClient.generated.h"

/**
 * @brief	Custom game viewport client for non-splitscreen multiplayer
 */
UCLASS()
class UCustomGameViewportClient : public UGameViewportClient
{
	GENERATED_UCLASS_BODY()

	void UpdateActiveSplitscreenType() OVERRIDE;

	/** Whether to use splitscreen or not */
	UPROPERTY(Category = CustomGameViewportClient, EditInstanceOnly, BlueprintReadWrite)
	uint32 bDontUseSplitscreen : 1;

	/** Whether to force four panels */
	UPROPERTY(Category = CustomGameViewportClient, EditInstanceOnly, BlueprintReadWrite)
	uint32 bFourPanels : 1;
};
