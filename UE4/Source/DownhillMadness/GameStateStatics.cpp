

#include "DownhillMadness.h"
#include "GameStateStatics.h"


uint8 UGameStateStatics::numberOfPlayers = 1;
TArray<uint8> UGameStateStatics::selectedCharacters = TArray<uint8>();
bool UGameStateStatics::reloadMenu = false;


// ----------------------------------------------------------------------------


UGameStateStatics::UGameStateStatics(const class FPostConstructInitializeProperties& PCIP)
: Super(PCIP)
{
	UGameStateStatics::numberOfPlayers = 1;
	UGameStateStatics::selectedCharacters = TArray<uint8>();
	UGameStateStatics::selectedCharacters.Add(0);
	UGameStateStatics::selectedCharacters.Add(0);
	UGameStateStatics::selectedCharacters.Add(0);
	UGameStateStatics::selectedCharacters.Add(0);
	UGameStateStatics::reloadMenu = false;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::SetNumberOfPlayers(uint8 numberOfPlayers)
{
	if (numberOfPlayers > 0 && numberOfPlayers < 5)
		UGameStateStatics::numberOfPlayers = numberOfPlayers;
}


// ----------------------------------------------------------------------------


uint8 UGameStateStatics::GetNumberOfPlayers()
{
	return UGameStateStatics::numberOfPlayers;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::SetSelectedCharacter(uint8 playerIndex, uint8 selectedCharacter)
{
	if (playerIndex >= 0 && playerIndex < 4 && selectedCharacter >= 0 && selectedCharacter < 6)
		UGameStateStatics::selectedCharacters[playerIndex] = selectedCharacter;
}


// ----------------------------------------------------------------------------


uint8 UGameStateStatics::GetSelectedCharacter(uint8 playerIndex)
{
	if (playerIndex >= 0 && playerIndex < 4)
		return UGameStateStatics::selectedCharacters[playerIndex];
	else
		return 0;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::SetReloadMenu(bool reloadMenu)
{
	UGameStateStatics::reloadMenu = reloadMenu;
}


// ----------------------------------------------------------------------------


bool UGameStateStatics::GetReloadMenu()
{
	return UGameStateStatics::reloadMenu;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::StartNoSplitscreenMultiplayer(UObject* WorldContextObject)
{
	if (GEngine)
	{
		UCustomGameViewportClient* customGameViewportClient = Cast<UCustomGameViewportClient>(GEngine->GameViewport);

		if (customGameViewportClient != nullptr)
			customGameViewportClient->bDontUseSplitscreen = true;

		FString outString;

		UPlayer* player = GEngine->GameViewport->CreatePlayer(1, outString, true);
		GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));

		player = GEngine->GameViewport->CreatePlayer(2, outString, true);
		GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));

		player = GEngine->GameViewport->CreatePlayer(3, outString, true);
		GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
	}
}


// ----------------------------------------------------------------------------


void UGameStateStatics::EndNoSplitscreenMultiplayer()
{
	if (GEngine)
	{
		UCustomGameViewportClient* customGameViewportClient = Cast<UCustomGameViewportClient>(GEngine->GameViewport);

		if (customGameViewportClient != nullptr)
			customGameViewportClient->bDontUseSplitscreen = false;

		GEngine->RemoveGamePlayer(GEngine->GameViewport, 1);
		GEngine->RemoveGamePlayer(GEngine->GameViewport, 2);
		GEngine->RemoveGamePlayer(GEngine->GameViewport, 3);
	}
}