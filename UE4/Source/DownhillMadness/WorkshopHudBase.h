

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

        UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = Hud)
        FVector2D MyCursorScreenPosition;

        UFUNCTION(BlueprintCallable, Category = Utility)
        bool cursorOverKartBody(FHitResult& hit);

        UFUNCTION(BlueprintCallable, Category = Utility)
        void cursorWorldLocation(FVector& WorldPosition, FVector& WorldDirection);
};
