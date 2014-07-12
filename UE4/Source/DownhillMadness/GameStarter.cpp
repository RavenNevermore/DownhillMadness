

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


void AGameStarter::StartGame(uint8 numberOfPlayers, const TArray<FSerializedVehicle>& vehicles, const TArray<uint8>& drivers)
{
	this->gameStarted = true;
	this->numberOfPlayers = numberOfPlayers;
	this->vehicles = TArray<FSerializedVehicle>(vehicles);
	this->drivers = TArray<uint8>(drivers);
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

		if (spawnedDriver != nullptr && currentPlayer >= 0 && currentPlayer < vehicles.Num())
		{
			FString outString;
			UPlayer* player = world->GetFirstLocalPlayerFromController();
			if (currentPlayer > 0 && GEngine)
			{
				player = GEngine->GameViewport->CreatePlayer(currentPlayer, outString, true);
				GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
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
}


