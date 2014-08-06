

#include "DownhillMadness.h"
#include "GameStateStatics.h"


uint8 UGameStateStatics::numberOfPlayers = 1;
TArray<uint8> UGameStateStatics::controllerIndexes = TArray<uint8>();
TArray<uint8> UGameStateStatics::selectedCharacters = TArray<uint8>();
TArray<FSerializedVehicle> UGameStateStatics::selectedVehicles = TArray<FSerializedVehicle>();
bool UGameStateStatics::reloadMenu = false;
TArray<FSerializedVehicle> UGameStateStatics::savedVehicles = TArray<FSerializedVehicle>();
TArray<float> UGameStateStatics::trackRecords = TArray<float>();
TArray<bool> UGameStateStatics::beatenRecords = TArray<bool>();
bool UGameStateStatics::ratatoskUnlocked = false;
bool UGameStateStatics::bifrostUnlocked = false;
bool UGameStateStatics::bIsFullscreen = false;
int32 UGameStateStatics::windowWidth = 1280;
int32 UGameStateStatics::windowHeight = 720;
uint8 UGameStateStatics::antiAliasingQuality = 2;
uint8 UGameStateStatics::graphicsQuality = 2;
float UGameStateStatics::musicVolume = 1.0f;
float UGameStateStatics::soundVolume = 1.0f;
float UGameStateStatics::voicesVolume = 1.0f;


// ----------------------------------------------------------------------------


UGameStateStatics::UGameStateStatics(const class FPostConstructInitializeProperties& PCIP)
: Super(PCIP)
{
	UGameStateStatics::numberOfPlayers = 1;

	UGameStateStatics::controllerIndexes = TArray<uint8>();
	UGameStateStatics::controllerIndexes.Add(0);
	UGameStateStatics::controllerIndexes.Add(1);
	UGameStateStatics::controllerIndexes.Add(2);
	UGameStateStatics::controllerIndexes.Add(3);

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
	UGameStateStatics::trackRecords.Add(599.999f);
	UGameStateStatics::trackRecords.Add(599.999f);
	UGameStateStatics::trackRecords.Add(599.999f);
	UGameStateStatics::trackRecords.Add(599.999f);
	UGameStateStatics::trackRecords.Add(599.999f);

	UGameStateStatics::beatenRecords = TArray<bool>();
	UGameStateStatics::beatenRecords.Add(false);
	UGameStateStatics::beatenRecords.Add(false);
	UGameStateStatics::beatenRecords.Add(false);
	UGameStateStatics::beatenRecords.Add(false);
	UGameStateStatics::beatenRecords.Add(true);

	UGameStateStatics::ratatoskUnlocked = false;
	UGameStateStatics::bifrostUnlocked = false;


	UGameStateStatics::bIsFullscreen = false;
	UGameStateStatics::windowWidth = 1280;
	UGameStateStatics::windowHeight = 720;

	UGameStateStatics::antiAliasingQuality = 2;
	UGameStateStatics::graphicsQuality = 2;
	UGameStateStatics::musicVolume = 1.0f;
	UGameStateStatics::soundVolume = 1.0f;
	UGameStateStatics::voicesVolume = 1.0f;


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


void UGameStateStatics::SetControllerIndexes(const TArray<uint8>& indexArray)
{
	if (indexArray.Num() == 4)
		UGameStateStatics::controllerIndexes = indexArray;
}


// ----------------------------------------------------------------------------


TArray<uint8> UGameStateStatics::GetControllerIndexes()
{
	return UGameStateStatics::controllerIndexes;
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
		//GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));

		player = GEngine->GameViewport->CreatePlayer(2, outString, true);
		//GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));

		player = GEngine->GameViewport->CreatePlayer(3, outString, true);
		//GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
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

		while (GEngine->GetGamePlayers(GEngine->GameViewport).Num() > 1)
			GEngine->RemoveGamePlayer(GEngine->GameViewport, 1);

		if (customGameViewportClient != nullptr)
			customGameViewportClient->UpdateActiveSplitscreenType();
	}
}


// ----------------------------------------------------------------------------


void UGameStateStatics::StartWorkshopMultiplayer(UObject* WorldContextObject)
{
	if (GEngine)
	{
		UCustomGameViewportClient* customGameViewportClient = Cast<UCustomGameViewportClient>(GEngine->GameViewport);

		if (customGameViewportClient != nullptr)
		{
			customGameViewportClient->bDontUseSplitscreen = false;
			//if (UGameStateStatics::numberOfPlayers == 3)
			//	customGameViewportClient->bFourPanels = true;
		}

		FString outString;

		for (int i = 1; i < UGameStateStatics::numberOfPlayers; i++)
		{
			UPlayer* player = GEngine->GameViewport->CreatePlayer(i, outString, true);
			//GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
		}
	}
}


// ----------------------------------------------------------------------------


void UGameStateStatics::EndWorkshopMultiplayer()
{
	if (GEngine)
	{
		UCustomGameViewportClient* customGameViewportClient = Cast<UCustomGameViewportClient>(GEngine->GameViewport);

		if (customGameViewportClient != nullptr)
		{
			customGameViewportClient->bDontUseSplitscreen = false;
			customGameViewportClient->bFourPanels = false;
		}

		while (GEngine->GetGamePlayers(GEngine->GameViewport).Num() > 1)
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


bool UGameStateStatics::GetBifrostUnlocked()
{
	return UGameStateStatics::bifrostUnlocked;
}


// ----------------------------------------------------------------------------


FString UGameStateStatics::GetTrackRecordString(uint8 trackIndex)
{
	if (trackIndex >= 0 && trackIndex < UGameStateStatics::trackRecords.Num())
	{
		int minutes = (int)(UGameStateStatics::trackRecords[trackIndex]) / (int)(60);
		int seconds = (int)(UGameStateStatics::trackRecords[trackIndex]) % (int)(60);
		int thousands = (int)(UGameStateStatics::trackRecords[trackIndex] * 1000.0f) % (int)(1000);

		FString outputString;
		outputString = FString::FromInt(minutes) + FString(TEXT(":"));
		if (seconds < 10)
			outputString += FString(TEXT("0"));
		outputString += FString::FromInt(seconds) + FString(TEXT("."));
		if (thousands < 100)
			outputString += FString(TEXT("0"));
		if (thousands < 10)
			outputString += FString(TEXT("0"));
		outputString += FString::FromInt(thousands);
		return outputString;
	}

	return FString(TEXT(""));
}


// ----------------------------------------------------------------------------


FString UGameStateStatics::TrackTimeToString(float trackTime)
{
	int minutes = (int)(trackTime) / (int)(60);
	int seconds = (int)(trackTime) % (int)(60);
	int thousands = (int)(trackTime * 1000.0f) % (int)(1000);

	FString outputString;
	outputString = FString::FromInt(minutes) + FString(TEXT(":"));
	if (seconds < 10)
		outputString += FString(TEXT("0"));
	outputString += FString::FromInt(seconds) + FString(TEXT("."));
	if (thousands < 100)
		outputString += FString(TEXT("0"));
	if (thousands < 10)
		outputString += FString(TEXT("0"));
	outputString += FString::FromInt(thousands);
	return outputString;
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
		createdSaveGame->bifrostUnlocked = UGameStateStatics::bifrostUnlocked;
		createdSaveGame->trackRecords = TArray<float>(UGameStateStatics::trackRecords);
		createdSaveGame->beatenRecords = TArray<bool>(UGameStateStatics::beatenRecords);
		createdSaveGame->bIsFullscreen = UGameStateStatics::bIsFullscreen;
		createdSaveGame->windowWidth = UGameStateStatics::windowWidth;
		createdSaveGame->windowHeight = UGameStateStatics::windowHeight;
		createdSaveGame->antiAliasingQuality = UGameStateStatics::antiAliasingQuality;
		createdSaveGame->graphicsQuality = UGameStateStatics::graphicsQuality;
		createdSaveGame->musicVolume = UGameStateStatics::musicVolume;
		createdSaveGame->soundVolume = UGameStateStatics::soundVolume;
		createdSaveGame->voicesVolume = UGameStateStatics::voicesVolume;
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
			UGameStateStatics::bifrostUnlocked = true;

		if (trackIndex == 3 || UGameStateStatics::beatenRecords[3] == true)
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
		serializedVehicle.vehicleName = FString(TEXT("Workshop ")) + FString::FromInt(slotIndex) + FString(TEXT(": ")) + UVehicleSpawnerLibrary::GetGeneratedVehicleName(serializedVehicle);
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
		FSerializedVehicle saveVehicle = vehicle;
		saveVehicle.vehicleName = FString(TEXT("Workshop ")) + FString::FromInt(slotIndex) + FString(TEXT(": ")) + UVehicleSpawnerLibrary::GetGeneratedVehicleName(saveVehicle);
		UGameStateStatics::savedVehicles[slotIndex] = saveVehicle;

		FString slotName = FString(TEXT("BuiltVehicle")) + FString::FromInt(slotIndex);

		USavedVehicle* createdVehicleSave = Cast<USavedVehicle>(UGameplayStatics::CreateSaveGameObject(USavedVehicle::StaticClass()));
		if (createdVehicleSave != nullptr)
		{
			createdVehicleSave->SetVehicle(saveVehicle);
			return UGameplayStatics::SaveGameToSlot(createdVehicleSave, slotName, 0);
		}
	}

	return false;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::SetViewportSettings(int32 NewSizeX, int32 NewSizeY, bool bIsFullscreen)
{
	UGameStateStatics::bIsFullscreen = bIsFullscreen;
	UGameStateStatics::windowWidth = NewSizeX;
	UGameStateStatics::windowHeight = NewSizeY;
	FSystemResolution::RequestResolutionChange(NewSizeX, NewSizeY, bIsFullscreen);
}


// ----------------------------------------------------------------------------


void UGameStateStatics::GetViewportSettings(int32& SizeX, int32& SizeY, bool& bIsFullscreen)
{
	bIsFullscreen = UGameStateStatics::bIsFullscreen;
	SizeX = UGameStateStatics::windowWidth;
	SizeY = UGameStateStatics::windowHeight;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::SetGameOptions(uint8 antiAliasingQuality, uint8 graphicsQuality, float musicVolume, float soundVolume, float voicesVolume)
{
	UGameStateStatics::antiAliasingQuality = antiAliasingQuality;
	UGameStateStatics::graphicsQuality = graphicsQuality;
	UGameStateStatics::musicVolume = musicVolume;
	UGameStateStatics::soundVolume = soundVolume;
	UGameStateStatics::voicesVolume = voicesVolume;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::GetGameOptions(uint8& antiAliasingQuality, uint8& graphicsQuality, float& musicVolume, float& soundVolume, float& voicesVolume)
{
	antiAliasingQuality = UGameStateStatics::antiAliasingQuality;
	graphicsQuality = UGameStateStatics::graphicsQuality;
	musicVolume = UGameStateStatics::musicVolume;
	soundVolume = UGameStateStatics::soundVolume;
	voicesVolume = UGameStateStatics::voicesVolume;
}


// ----------------------------------------------------------------------------


void UGameStateStatics::SetCameraBlendables(UCameraComponent* camera, const TArray<UObject*>& blendables)
{
	camera->PostProcessSettings.Blendables = TArray<UObject*>(blendables);
}


// ----------------------------------------------------------------------------


UObject* UGameStateStatics::GetClassDefaultObject(UClass* inClass)
{
	return inClass->GetDefaultObject(true);
}


// ----------------------------------------------------------------------------


FString UGameStateStatics::ReplaceUmlaut(const FString& inString)
{
	FString tempString = inString.Replace(TEXT("ö"), TEXT("o"), ESearchCase::CaseSensitive);
	tempString = tempString.Replace(TEXT("?"), TEXT("o"), ESearchCase::CaseSensitive);
	return tempString;
}


// ----------------------------------------------------------------------------


APlayerController* UGameStateStatics::GetPlayerControllerFromID(int32 inID)
{
	if (GEngine)
	{
		ULocalPlayer* foundPlayer = GEngine->GetLocalPlayerFromControllerId(GEngine->GameViewport, inID);
		if (foundPlayer != nullptr)
		{
			return foundPlayer->PlayerController;
		}
	}

	return nullptr;
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
			UGameStateStatics::bifrostUnlocked = loadedSaveGame->bifrostUnlocked;
			UGameStateStatics::trackRecords = TArray<float>(loadedSaveGame->trackRecords);
			UGameStateStatics::beatenRecords = TArray<bool>(loadedSaveGame->beatenRecords);
			UGameStateStatics::bIsFullscreen = loadedSaveGame->bIsFullscreen;
			UGameStateStatics::windowWidth = loadedSaveGame->windowWidth;
			UGameStateStatics::windowHeight = loadedSaveGame->windowHeight;
			UGameStateStatics::antiAliasingQuality = loadedSaveGame->antiAliasingQuality;
			UGameStateStatics::graphicsQuality = loadedSaveGame->graphicsQuality;
			UGameStateStatics::musicVolume = loadedSaveGame->musicVolume;
			UGameStateStatics::soundVolume = loadedSaveGame->soundVolume;
			UGameStateStatics::voicesVolume = loadedSaveGame->voicesVolume;
		}
	}
}