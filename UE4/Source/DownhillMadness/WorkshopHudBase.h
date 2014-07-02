

#pragma once

#include "GameFramework/HUD.h"
#include "WorkshopHudBase.generated.h"

/**
 * 
 */
UCLASS()
class AWorkshopHudBase : public AHUD
{
    GENERATED_UCLASS_BODY()

        UPROPERTY(BlueprintReadWrite, VisibleAnywhere, Category = Hud)
        FVector2D MyCursorScreenPosition;

        UFUNCTION(BlueprintCallable, Category = Utility)
        bool cursorOverKartBody();
	
};
