

#include "DownhillMadness.h"
#include "CustomGameViewportClient.h"


UCustomGameViewportClient::UCustomGameViewportClient(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	UGameStateStatics::SetViewportSettings(UGameStateStatics::windowWidth, UGameStateStatics::windowHeight, UGameStateStatics::bIsFullscreen);

	this->bFourPanels = false;
	this->bDontUseSplitscreen = false;
}


// ----------------------------------------------------------------------------


void UCustomGameViewportClient::UpdateActiveSplitscreenType()
{
	if (this->bDontUseSplitscreen)
		this->ActiveSplitscreenType = ESplitScreenType::None;
	else
	{
		if (this->bFourPanels)
			this->ActiveSplitscreenType = ESplitScreenType::FourPlayer;
		else
			Super::UpdateActiveSplitscreenType();
	}
}
