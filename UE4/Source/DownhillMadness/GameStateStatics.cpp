

#include "DownhillMadness.h"
#include "GameStateStatics.h"


uint8 UGameStateStatics::numberOfPlayers = 1;
TArray<uint8> UGameStateStatics::selectedCharacters = TArray<uint8>();
TArray<FSerializedVehicle> UGameStateStatics::selectedVehicles = TArray<FSerializedVehicle>();
bool UGameStateStatics::reloadMenu = false;
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


	UGameStateStatics::LoadAllVehicles();


	UGameStateStatics::trackRecords = TArray<float>();
	UGameStateStatics::trackRecords.Add(90.0f);
	UGameStateStatics::trackRecords.Add(90.0f);
	UGameStateStatics::trackRecords.Add(90.0f);
	UGameStateStatics::trackRecords.Add(90.0f);
	UGameStateStatics::trackRecords.Add(90.0f);

	UGameStateStatics::beatenRecords = TArray<bool>();
	UGameStateStatics::beatenRecords.Add(false);
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


void UGameStateStatics::SetSelectedVehicle(uint8 playerIndex, const FSerializedVehicle& vehicle)
{
	if (playerIndex >= 0 && playerIndex < 4 && vehicle.bodyClass != nullptr)
		UGameStateStatics::selectedVehicles[playerIndex] = vehicle;
}


// ----------------------------------------------------------------------------


FSerializedVehicle UGameStateStatics::GetSelectedVehicle(uint8 playerIndex)
{
	if (playerIndex >= 0 && playerIndex < 4)
		return UGameStateStatics::selectedVehicles[playerIndex];
	else
		return FSerializedVehicle();
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


TArray<FSerializedVehicle> UGameStateStatics::GetWorkshopVehicles()
{
	return TArray<FSerializedVehicle>(UGameStateStatics::savedVehicles);
}


// ----------------------------------------------------------------------------


TArray<FSerializedVehicle> UGameStateStatics::GetAvailableVehicles()
{
	TArray<FSerializedVehicle> availableVehicles = TArray<FSerializedVehicle>();
	availableVehicles.Empty();

	for (TArray<FSerializedVehicle>::TIterator vehicleIter(UGameStateStatics::savedVehicles); vehicleIter; ++vehicleIter)
	{
		FSerializedVehicle currentVehicle = *vehicleIter;

		if (currentVehicle.bodyClass != nullptr)
			availableVehicles.Add(currentVehicle);
	}

	FSerializedVehicle staticVehicle;
	UVehicleSpawnerLibrary::LoadStaticVehicle(staticVehicle, 1);
	if (staticVehicle.bodyClass != nullptr)
		availableVehicles.Add(staticVehicle);

	staticVehicle = FSerializedVehicle();
	UVehicleSpawnerLibrary::LoadStaticVehicle(staticVehicle, 2);
	if (staticVehicle.bodyClass != nullptr)
		availableVehicles.Add(staticVehicle);

	staticVehicle = FSerializedVehicle();
	UVehicleSpawnerLibrary::LoadStaticVehicle(staticVehicle, 3);
	if (staticVehicle.bodyClass != nullptr)
		availableVehicles.Add(staticVehicle);

	staticVehicle = FSerializedVehicle();
	UVehicleSpawnerLibrary::LoadStaticVehicle(staticVehicle, 4);
	if (staticVehicle.bodyClass != nullptr)
		availableVehicles.Add(staticVehicle);

	staticVehicle = FSerializedVehicle();
	UVehicleSpawnerLibrary::LoadStaticVehicle(staticVehicle, 5);
	if (staticVehicle.bodyClass != nullptr)
		availableVehicles.Add(staticVehicle);

	return availableVehicles;
}


// ----------------------------------------------------------------------------


TArray<AActor*> UGameStateStatics::FindActorsOfType(UObject* WorldContextObject, UClass* targetActorClass)
{
	TArray<AActor*> actorArray = TArray<AActor*>();
	actorArray.Empty();

	TActorIterator<AActor> allActors = TActorIterator<AActor>(WorldContextObject->GetWorld());

	while (allActors)
	{
		AActor* currentActor = *allActors;

		if (currentActor->GetClass()->GetFullName() == targetActorClass->GetFullName())
			actorArray.Add(currentActor);

		++allActors;
	}

	return actorArray;
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


bool UGameStateStatics::SaveTrackRecord(uint8 trackIndex, float trackRecord)
{
	if (trackIndex >= 0 && trackIndex < UGameStateStatics::trackRecords.Num() && trackIndex < UGameStateStatics::beatenRecords.Num())
	{
		if (trackRecord < UGameStateStatics::trackRecords[trackIndex])
		{
			UGameStateStatics::trackRecords[trackIndex] = trackRecord;
			UGameStateStatics::beatenRecords[trackIndex] = true;
		}

		if (!(UGameStateStatics::beatenRecords.Contains(false)))
			UGameStateStatics::ratatoskUnlocked = true;
	}

	return UGameStateStatics::SaveGameData();
}


// ----------------------------------------------------------------------------


bool UGameStateStatics::SaveVehicle(AVehicleBodyBase* vehicle, uint8 slotIndex)
{
	if (slotIndex >= 0 && slotIndex < UGameStateStatics::maxVehicleSlots)
	{
		FSerializedVehicle serializedVehicle;
		UVehicleSpawnerLibrary::SerializeVehicle(serializedVehicle, vehicle);
		UGameStateStatics::savedVehicles[slotIndex] = serializedVehicle;

		FString slotName = FString(TEXT("BuiltVehicle")) + FString::FromInt(slotIndex);

		USavedVehicle* createdVehicleSave = Cast<USavedVehicle>(UGameplayStatics::CreateSaveGameObject(USavedVehicle::StaticClass()));
		if (createdVehicleSave != nullptr)
		{
			createdVehicleSave->SetVehicle(serializedVehicle);
			return UGameplayStatics::SaveGameToSlot(createdVehicleSave, slotName, 0);
		}
	}

	return false;
}


// ----------------------------------------------------------------------------


bool UGameStateStatics::SaveSerializedVehicle(const FSerializedVehicle& vehicle, uint8 slotIndex)
{
	if (slotIndex >= 0 && slotIndex < UGameStateStatics::maxVehicleSlots)
	{
		UGameStateStatics::savedVehicles[slotIndex] = vehicle;

		FString slotName = FString(TEXT("BuiltVehicle")) + FString::FromInt(slotIndex);

		USavedVehicle* createdVehicleSave = Cast<USavedVehicle>(UGameplayStatics::CreateSaveGameObject(USavedVehicle::StaticClass()));
		if (createdVehicleSave != nullptr)
		{
			createdVehicleSave->SetVehicle(vehicle);
			return UGameplayStatics::SaveGameToSlot(createdVehicleSave, slotName, 0);
		}
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

		if (UGameplayStatics::DoesSaveGameExist(slotName, 0))
		{
			USavedVehicle* loadedVehicle = Cast<USavedVehicle>(UGameplayStatics::LoadGameFromSlot(slotName, 0));

			if (loadedVehicle != nullptr)
				UGameStateStatics::savedVehicles.Add(loadedVehicle->GetVehicle());
			else
				UGameStateStatics::savedVehicles.Add(FSerializedVehicle());
		}
		else
			UGameStateStatics::savedVehicles.Add(FSerializedVehicle());
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