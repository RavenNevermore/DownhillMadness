

#include "DownhillMadness.h"
#include "CustomGameViewportClient.h"


UCustomGameViewportClient::UCustomGameViewportClient(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
}


// ----------------------------------------------------------------------------


void UCustomGameViewportClient::UpdateActiveSplitscreenType()
{
	if (this->bDontUseSplitscreen)
		this->ActiveSplitscreenType = ESplitScreenType::None;
	else
		Super::UpdateActiveSplitscreenType();
}
