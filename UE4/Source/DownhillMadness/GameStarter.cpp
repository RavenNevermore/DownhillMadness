

#include "DownhillMadness.h"
#include "GameStarter.h"


AGameStarter::AGameStarter(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->Root = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("Root")));
	this->RootComponent = this->Root;

	this->driverClasses.Empty();
}


// ----------------------------------------------------------------------------


void AGameStarter::StartGame(uint8 numberOfPlayers, const TArray<AVehicleSpawner*>& vehicles, const TArray<uint8>& drivers)
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

		if (spawnedDriver != nullptr && currentPlayer >= 0 && currentPlayer < vehicles.Num())
		{
			FString outString;
			if (currentPlayer > 0 && GEngine)
			{
				GEngine->AddGamePlayer(GEngine->GameViewport, GEngine->GameViewport->CreatePlayer(currentPlayer, outString, true));
			}

			APlayerController* playerController = nullptr;

			UWorld* world = this->GetWorld();
			uint32 index = 0;
			for (FConstPlayerControllerIterator iterator = world->GetPlayerControllerIterator(); iterator && playerController == nullptr; ++iterator)
			{
				APlayerController* currentPlayerController = *iterator;
				if (index == currentPlayer)
				{
					playerController = currentPlayerController;
				}
				index++;
			}

			if (playerController != nullptr)
				playerController->Possess(spawnedDriver);

			AVehicleBodyBase* spawnedVehicle = vehicles[currentPlayer]->SpawnVehicle(spawnPos, spawnRotation);

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


