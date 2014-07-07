

#include "DownhillMadness.h"
#include "WorkshopHudBase.h"


AWorkshopHudBase::AWorkshopHudBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{

}


bool AWorkshopHudBase::cursorOverKartBody(FHitResult& hit){
    //FHitResult hit;
    GetOwningPlayerController()->GetHitResultAtScreenPosition(this->MyCursorScreenPosition, ECC_Visibility, false, hit);
    
    AActor* actor = hit.GetActor();
    if (NULL == actor)
        return false;

    //FString msg = "Hit: ";
    //msg += actor->GetClass()->GetName();
    //GEngine->AddOnScreenDebugMessage(-1, 5.f, FColor::Blue, msg);
    
    return actor->GetClass()->IsChildOf(AVehicleBodyBase::StaticClass());
    //return 0 == ((int)GetWorld()->RealTimeSeconds) % 2;
}

void AWorkshopHudBase::cursorWorldLocation(FVector& WorldPosition, FVector& WorldDirection){

    ULocalPlayer* LocalPlayer = Cast<ULocalPlayer>(GetOwningPlayerController()->Player);

    if (LocalPlayer != NULL && LocalPlayer->ViewportClient != NULL && LocalPlayer->ViewportClient->Viewport != NULL)
    {
        FVector2D ScreenPosition = this->MyCursorScreenPosition;

        // Create a view family for the game viewport
        FSceneViewFamilyContext ViewFamily(FSceneViewFamily::ConstructionValues(
            LocalPlayer->ViewportClient->Viewport,
            GetWorld()->Scene,
            LocalPlayer->ViewportClient->EngineShowFlags)
            .SetRealtimeUpdate(true));

        // Calculate a view where the player is to update the streaming from the players start location
        FVector ViewLocation;
        FRotator ViewRotation;
        FSceneView* SceneView = LocalPlayer->CalcSceneView(&ViewFamily, /*out*/ ViewLocation, /*out*/ ViewRotation, LocalPlayer->ViewportClient->Viewport);

        if (SceneView)
        {
            SceneView->DeprojectFVector2D(ScreenPosition, WorldPosition, WorldDirection);
        }
    }
}
