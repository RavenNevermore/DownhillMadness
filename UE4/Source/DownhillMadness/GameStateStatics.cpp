

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