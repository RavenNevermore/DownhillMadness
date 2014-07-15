

#pragma once

#include "GameFramework/Pawn.h"
#include "DriverSpectatorPawn.generated.h"

/**
 * 
 */
UCLASS()
class ADriverSpectatorPawn : public APawn
{
	GENERATED_UCLASS_BODY()

	/** Camera of spectator */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UCameraComponent> SpectatorCamera;	
};
