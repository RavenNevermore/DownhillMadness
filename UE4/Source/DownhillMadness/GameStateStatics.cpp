

#include "DownhillMadness.h"
#include "GameStateStatics.h"


uint8 UGameStateStatics::numberOfPlayers = 1;
TArray<uint8> UGameStateStatics::selectedCharacters = TArray<uint8>();
TArray<FSerializedVehicle> UGameStateStatics::selectedVehicles = TArray<FSerializedVehicle>();
bool UGameStateStatics::reloadMenu = false;
TArray<FSerializedVehicle> UGameStateStatics::workshopVehicles = TArray<FSerializedVehicle>();
TArray<FSerializedVehicle> UGameStateStatics::savedVehicles = TArray<FSerializedVehicle>();
TArray<float> UGameStateStatics::trackRecords = TArray<float>();
TArray<bool> UGameStateStatics::beatenRecords = TArray<bool>();
bool UGameStateStatics::ratatoskUnlocked = false;


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

	FSerializedVehicle defaultVehicle;
	UVehicleSpawnerLibrary::LoadStaticVehicle(defaultVehicle, 1);
	UGameStateStatics::selectedVehicles = TArray<FSerializedVehicle>();
	UGameStateStatics::selectedVehicles.Add(defaultVehicle);
	UGameStateStatics::selectedVehicles.Add(defaultVehicle);
	UGameStateStatics::selectedVehicles.Add(defaultVehicle);
	UGameStateStatics::selectedVehicles.Add(defaultVehicle);

	UGameStateStatics::reloadMenu = false;

	UGameStateStatics::workshopVehicles = TArray<FSerializedVehicle>();
	UGameStateStatics::workshopVehicles.Add(FSerializedVehicle());
	UGameStateStatics::workshopVehicles.Add(FSerializedVehicle());
	UGameStateStatics::workshopVehicles.Add(FSerializedVehicle());
	UGameStateStatics::workshopVehicles.Add(FSerializedVehicle());


	UGameStateStatics::LoadAllVehicles();


	UGameStateStatics::trackRecords = TArray<float>();
	UGameStateStatics::trackRecords.Add(599.99f);
	UGameStateStatics::trackRecords.Add(599.99f);
	UGameStateStatics::trackRecords.Add(599.99f);
	UGameStateStatics::trackRecords.Add(599.99f);

	UGameStateStatics::beatenRecords = TArray<bool>();
	UGameStateStatics::beatenRecords.Add(false);
	UGameStateStatics::beatenRecords.Add(false);
	UGameStateStatics::beatenRecords.Add(false);
	UGameStateStatics::beatenRecords.Add(false);

	UGameStateStatics::ratatoskUnlocked = false;


	UGameStateStatics::LoadSavedGame();
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

		GEngine->RemoveGamePlayer(GEngine->GameViewport, 3);
		GEngine->RemoveGamePlayer(GEngine->GameViewport, 2);
		GEngine->RemoveGamePlayer(GEngine->GameViewport, 1);

		if (customGameViewportClient != nullptr)
			customGameViewportClient->UpdateActiveSplitscreenType();
	}
}


// ----------------------------------------------------------------------------


float UGameStateStatics::GetNearClipPlane()
{
	if (GEngine)
	{
		return GEngine->NearClipPlane;
	}

	return 10.0f;
}


// ----------------------------------------------------------------------------


uint8 UGameStateStatics::GetMaxVehicleSlots()
{
	return UGameStateStatics::maxVehicleSlots;
}


// ----------------------------------------------------------------------------


bool UGameStateStatics::GetRatatoskUnlocked()
{
	return UGameStateStatics::ratatoskUnlocked;
}


// ----------------------------------------------------------------------------


bool UGameStateStatics::SaveGameData()
{
	USavedGameData* createdSaveGame = Cast<USavedGameData>(UGameplayStatics::CreateSaveGameObject(USavedGameData::StaticClass()));
	if (createdSaveGame != nullptr)
	{
		createdSaveGame->ratatoskUnlocked = UGameStateStatics::ratatoskUnlocked;
		createdSaveGame->trackRecords = TArray<float>(UGameStateStatics::trackRecords);
		createdSaveGame->beatenRecords = TArray<bool>(UGameStateStatics::beatenRecords);
		return UGameplayStatics::SaveGameToSlot(createdSaveGame, FString(TEXT("GameData")), 0);
	}

	return false;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::LoadAllVehicles()
{
	UGameStateStatics::savedVehicles = TArray<FSerializedVehicle>();

	for (uint32 i = 0; i < UGameStateStatics::maxVehicleSlots; i++)
	{
		FString slotName = FString(TEXT("BuiltVehicle")) + FString::FromInt(i);

	}
}


// ----------------------------------------------------------------------------


void UGameStateStatics::LoadSavedGame()
{
	if (UGameplayStatics::DoesSaveGameExist(FString(TEXT("GameData")), 0))
	{
		USavedGameData* loadedSaveGame = Cast<USavedGameData>(UGameplayStatics::LoadGameFromSlot(FString(TEXT("GameData")), 0));

		if (loadedSaveGame != nullptr)
		{
			UGameStateStatics::ratatoskUnlocked = loadedSaveGame->ratatoskUnlocked;
			UGameStateStatics::trackRecords = TArray<float>(loadedSaveGame->trackRecords);
			UGameStateStatics::beatenRecords = TArray<bool>(loadedSaveGame->beatenRecords);
		}
	}
}