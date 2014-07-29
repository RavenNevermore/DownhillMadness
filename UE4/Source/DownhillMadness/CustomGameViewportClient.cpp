

#include "DownhillMadness.h"
#include "CustomGameViewportClient.h"


UCustomGameViewportClient::UCustomGameViewportClient(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	UGameStateStatics::SetViewportSettings(UGameStateStatics::windowWidth, UGameStateStatics::windowHeight, UGameStateStatics::bIsFullscreen);
}


// ----------------------------------------------------------------------------


void UCustomGameViewportClient::UpdateActiveSplitscreenType()
{
	if (this->bDontUseSplitscreen)
		this->ActiveSplitscreenType = ESplitScreenType::None;
	else
		Super::UpdateActiveSplitscreenType();
}
