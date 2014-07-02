

#include "DownhillMadness.h"
#include "WorkshopHudBase.h"


AWorkshopHudBase::AWorkshopHudBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{

}


bool AWorkshopHudBase::cursorOverKartBody(){
    FHitResult hit;
    GetOwningPlayerController()->GetHitResultAtScreenPosition(this->MyCursorScreenPosition, ECC_Visibility, false, hit);
    
    AActor* actor = hit.GetActor();
    if (NULL == actor)
        return false;

    FString msg = "Hit: ";
    msg += actor->GetClass()->GetName();
    GEngine->AddOnScreenDebugMessage(-1, 5.f, FColor::Blue, msg);
    
    return actor->GetClass()->IsChildOf(AVehicleBodyBase::StaticClass());
    //return 0 == ((int)GetWorld()->RealTimeSeconds) % 2;
}

