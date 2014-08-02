

#include "DownhillMadness.h"
#include "GameStarter.h"


AGameStarter::AGameStarter(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->Root = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("Root")));
	this->RootComponent = this->Root;

	this->driverClasses.Empty();
	this->gameStarted = false;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void AGameStarter::Tick(float DeltaSeconds)
{
	if (this->gameStarted)
	{
		this->StartGameInternal(this->numberOfPlayers, this->vehicles, this->drivers);
		this->gameStarted = false;
	}
}


// ----------------------------------------------------------------------------


void AGameStarter::StartGame()
{
	this->numberOfPlayers = UGameStateStatics::numberOfPlayers;
	this->vehicles = TArray<FSerializedVehicle>(UGameStateStatics::selectedVehicles);
	this->drivers = TArray<uint8>(UGameStateStatics::selectedCharacters);
	this->gameStarted = true;
}


// ----------------------------------------------------------------------------


void AGameStarter::StartGameInternal(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers)
{
	TActorIterator<ASpawnPoint> spawnPoints = TActorIterator<ASpawnPoint>(this->GetWorld());
	uint8 currentPlayer = 0;

	while (spawnPoints && currentPlayer < numberOfPlayers)
	{
		ADriverPawn* spawnedDriver = nullptr;
		FVector spawnPos = spawnPoints->GetActorLocation();
		FRotator spawnRotation = spawnPoints->GetActorRotation();

		if (currentPlayer < drivers.Num() && drivers[currentPlayer] >= 0 && drivers[currentPlayer] < this->driverClasses.Num())
		{
			FActorSpawnParameters spawnParameters;
			spawnedDriver = (ADriverPawn*)(this->GetWorld()->SpawnActor(this->driverClasses[drivers[currentPlayer]], &spawnPos, &spawnRotation, spawnParameters));
		}

		UWorld* world = this->GetWorld();

		if (GEngine)
		{
			UCustomGameViewportClient* customGameViewportClient = Cast<UCustomGameViewportClient>(GEngine->GameViewport);

			if (customGameViewportClient != nullptr)
				customGameViewportClient->bDontUseSplitscreen = false;
		}

		if (spawnedDriver != nullptr && currentPlayer >= 0 && currentPlayer < vehicles.Num())
		{
			FString outString;
			UPlayer* player = world->GetFirstLocalPlayerFromController();
			if (currentPlayer > 0 && GEngine)
			{
				player = GEngine->GameViewport->CreatePlayer(currentPlayer, outString, true);
				GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
			}

			ULocalPlayer* localPlayer = Cast<ULocalPlayer>(player);
			if (localPlayer != nullptr)
			{
				localPlayer->ControllerId = UGameStateStatics::controllerIndexes[currentPlayer];
				spawnedDriver->controllerIndex = localPlayer->ControllerId;
			}

			APlayerController* playerController = nullptr;

			for (FConstPlayerControllerIterator iterator = world->GetPlayerControllerIterator(); iterator && playerController == nullptr; ++iterator)
			{
				APlayerController* currentPlayerController = *iterator;
				if (currentPlayerController->Player == player)
				{
					playerController = currentPlayerController;
				}
			}

			if (playerController != nullptr)
			{
				playerController->AutoReceiveInput = (EAutoReceiveInput::Type)(currentPlayer + 1);
				playerController->EnableInput(playerController);
				playerController->Possess(spawnedDriver);
			}

			AVehicleBodyBase* spawnedVehicle = UVehicleSpawnerLibrary::SpawnVehicle(this, vehicles[currentPlayer], spawnPos, spawnRotation);

			if (spawnedVehicle != nullptr)
			{
				spawnedVehicle->EnablePhysics();
				spawnedDriver->SetVehicle(spawnedVehicle);
				spawnedDriver->StartRace();
			}
		}

		currentPlayer++;
		++spawnPoints;
	}


	// Spawn spectator in three player splitscreen

	if (numberOfPlayers == 3)
	{
		FActorSpawnParameters spawnParameters;
		FVector spawnPos;
		FRotator spawnRotation;

		if (spawnPoints)
		{
			spawnPos = spawnPoints->GetActorLocation();
			spawnRotation = spawnPoints->GetActorRotation();
		}

		ADriverSpectatorPawn* spawnedSpectator = (ADriverSpectatorPawn*)(this->GetWorld()->SpawnActor(ADriverSpectatorPawn::StaticClass(), &spawnPos, &spawnRotation, spawnParameters));

		UWorld* world = this->GetWorld();

		if (spawnedSpectator != nullptr)
		{
			FString outString;
			UPlayer* player = world->GetFirstLocalPlayerFromController();
			if (GEngine)
			{
				player = GEngine->GameViewport->CreatePlayer(currentPlayer, outString, true);
				GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
			}

			ULocalPlayer* localPlayer = Cast<ULocalPlayer>(player);
			if (localPlayer != nullptr)
			{
				localPlayer->ControllerId = UGameStateStatics::controllerIndexes[3];
			}

			APlayerController* playerController = nullptr;

			for (FConstPlayerControllerIterator iterator = world->GetPlayerControllerIterator(); iterator && playerController == nullptr; ++iterator)
			{
				APlayerController* currentPlayerController = *iterator;
				if (currentPlayerController->Player == player)
				{
					playerController = currentPlayerController;
				}
			}

			if (playerController != nullptr)
			{
				playerController->AutoReceiveInput = (EAutoReceiveInput::Type)(currentPlayer + 1);
				playerController->EnableInput(playerController);
				playerController->Possess(spawnedSpectator);
			}
		}
	}
}


// ----------------------------------------------------------------------------


void AGameStarter::EndGame()
{
	if (GEngine)
	{
		GEngine->RemoveGamePlayer(GEngine->GameViewport, 3);
		GEngine->RemoveGamePlayer(GEngine->GameViewport, 2);
		GEngine->RemoveGamePlayer(GEngine->GameViewport, 1);
	}
}


