

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

	this->rankingArray = TArray<uint8>();
	this->rankingArray.Empty();
	this->rankingArray.Add(0);
	this->rankingArray.Add(1);
	this->rankingArray.Add(2);
	this->rankingArray.Add(3);

	this->progressArray = TArray<float>();
	this->progressArray.Empty();
	this->progressArray.Add(0.0f);
	this->progressArray.Add(0.0f);
	this->progressArray.Add(0.0f);
	this->progressArray.Add(0.0f);

	this->currentRaceDuration = 0.0f;
}


// ----------------------------------------------------------------------------


void AGameStarter::Tick(float DeltaSeconds)
{
	if ((this->timeRunning || this->startingRace) && !(this->raceOver))
	{
		for (TArray<ADriverPawn*>::TIterator driverIter(this->driverActors); driverIter; ++driverIter)
		{
			ADriverPawn* currentDriver = *driverIter;

			if (currentDriver != nullptr && this->playerTracker != nullptr)
			{
				this->progressArray[currentDriver->controllerIndex] = this->playerTracker->RelativeSplinePosition(currentDriver->DriverCapsule->BodyInstance.GetUnrealWorldTransform().GetLocation());
				if (this->progressArray[currentDriver->controllerIndex] >= 1.0f)
				{
					FVector spawnPos = FVector::ZeroVector;
					FRotator spawnRotation = FRotator::ZeroRotator;
					if (this->playersGoalPodest != nullptr)
					{
						spawnPos = this->playersGoalPodest->GetActorLocation();
						spawnRotation = this->playersGoalPodest->GetActorRotation();
					}
					AResultsPawn* resultsPawn = (AResultsPawn*)(this->GetWorld()->SpawnActor(AResultsPawn::StaticClass(), &spawnPos, &spawnRotation, FActorSpawnParameters()));
					resultsPawn->ranking = this->finishedPlayers.Num();
					resultsPawn->playerTime = this->currentRaceDuration;
					resultsPawn->controllerIndex = currentDriver->controllerIndex;
					currentDriver->Controller->Possess(resultsPawn);

					APlayerController* playerController = Cast<APlayerController>(resultsPawn->Controller);
					if (playerController != nullptr)
					{
						playerController->ClientSetHUD(this->resultsHUDclass);
					}

					switch (this->finishedPlayers.Num())
					{
					case 0:
						spawnPos = this->playersGoalPodest->SocketFirst->GetComponentLocation();
						spawnRotation = this->playersGoalPodest->SocketFirst->GetComponentRotation();
						break;
					case 1:
						spawnPos = this->playersGoalPodest->SocketSecond->GetComponentLocation();
						spawnRotation = this->playersGoalPodest->SocketSecond->GetComponentRotation();
						break;
					case 2:
						spawnPos = this->playersGoalPodest->SocketThird->GetComponentLocation();
						spawnRotation = this->playersGoalPodest->SocketThird->GetComponentRotation();
						break;
					case 3:
						spawnPos = this->playersGoalPodest->SocketFourth->GetComponentLocation();
						spawnRotation = this->playersGoalPodest->SocketFourth->GetComponentRotation();
						break;
					}
					AHappyActor* happyActor = (AHappyActor*)(this->GetWorld()->SpawnActor(currentDriver->happyActorClass, &spawnPos, &spawnRotation, FActorSpawnParameters()));

					switch (currentDriver->controllerIndex)
					{
					case 0:
						happyActor->PlayerMaterialBillboard->SetMaterial(0, this->playerOneMaterial);
						break;
					case 1:
						happyActor->PlayerMaterialBillboard->SetMaterial(0, this->playerTwoMaterial);
						break;
					case 2:
						happyActor->PlayerMaterialBillboard->SetMaterial(0, this->playerThreeMaterial);
						break;
					case 3:
						happyActor->PlayerMaterialBillboard->SetMaterial(0, this->playerFourMaterial);
						break;
					}

					currentDriver->FinishedRace(this->finishedPlayers.Num(), this->numberOfPlayers);
					this->finishedPlayers.Add(TKeyValuePair<float, uint8>(this->currentRaceDuration, currentDriver->controllerIndex));
					currentDriver->controlledVehicle->DestroyVehicle();
					this->GetWorld()->DestroyActor(currentDriver);
					this->driverActors[driverIter.GetIndex()] = nullptr;
				}
			}
		}

		TArray<TKeyValuePair<float, uint8>> newRanking = TArray<TKeyValuePair<float, uint8>>();
		newRanking.Empty();
		for (int i = 0; i < this->driverActors.Num(); i++)
		{
			if (this->driverActors[i] != nullptr)
			newRanking.Add(TKeyValuePair<float, uint8>(this->progressArray[this->driverActors[i]->controllerIndex], this->driverActors[i]->controllerIndex));
		}
		newRanking.Sort();

		TArray<uint8> newRankingOrder = TArray<uint8>();
		newRankingOrder.Empty();
		for (int i = newRanking.Num() - 1; i >= 0; i--)
		{
			newRankingOrder.Add(newRanking[i].Value);
		}
		for (int i = this->finishedPlayers.Num() - 1; i >= 0; i--)
			newRankingOrder.Insert(this->finishedPlayers[i].Value, 0);

		for (int i = 0; i < newRankingOrder.Num() && i < this->rankingArray.Num(); i++)
			this->rankingArray[i] = newRankingOrder[i];

		if ((this->finishedPlayers.Num() >= this->numberOfPlayers - 1 && this->numberOfPlayers > 1) || (this->finishedPlayers.Num() == 1 && this->numberOfPlayers == 1))
		{
			for (TArray<ADriverPawn*>::TIterator driverIter(this->driverActors); driverIter; ++driverIter)
			{
				ADriverPawn* currentDriver = *driverIter;

				if (currentDriver != nullptr)
				{
					currentDriver->FinishedRace(this->finishedPlayers.Num(), this->numberOfPlayers);
					this->finishedPlayers.Add(TKeyValuePair<float, uint8>(this->currentRaceDuration, currentDriver->controllerIndex));
					currentDriver->controlledVehicle->DestroyVehicle();
					this->GetWorld()->DestroyActor(currentDriver);
					this->driverActors[driverIter.GetIndex()] = nullptr;
				}
			}

			//this->EndGame();

			UCustomGameViewportClient* customGameViewportClient = Cast<UCustomGameViewportClient>(GEngine->GameViewport);
			if (customGameViewportClient != nullptr)
			{
				customGameViewportClient->bDontUseSplitscreen = false;
				customGameViewportClient->UpdateActiveSplitscreenType();
				customGameViewportClient->LayoutPlayers();
				customGameViewportClient->bDontUseSplitscreen = true;
				customGameViewportClient->LayoutPlayers();
			}

			for (int i = 0; i < this->numberOfPlayers; i++)
			{
				/*FString outString;
				UPlayer* player = this->GetWorld()->GetFirstLocalPlayerFromController();
				if (i > 0 && GEngine)
				{
					player = GEngine->GameViewport->CreatePlayer(i, outString, true);
				}

				ULocalPlayer* localPlayer = Cast<ULocalPlayer>(player);
				if (localPlayer != nullptr)
				{
					localPlayer->ControllerId = UGameStateStatics::controllerIndexes[i];
				}*/

				FVector spawnPos = FVector::ZeroVector;
				FRotator spawnRotation = FRotator::ZeroRotator;
				if (this->playersGoalPodest != nullptr)
				{
					spawnPos = this->playersGoalPodest->GetActorLocation();
					spawnRotation = this->playersGoalPodest->GetActorRotation();
				}

				AResultsPawn* resultsPawn = (AResultsPawn*)(this->GetWorld()->SpawnActor(AResultsPawn::StaticClass(), &spawnPos, &spawnRotation, FActorSpawnParameters()));
				resultsPawn->controllerIndex = UGameStateStatics::controllerIndexes[i];
				resultsPawn->raceOver = true;
				resultsPawn->rankingArray.Empty();
				resultsPawn->recordsArray.Empty();
				for (int j = 0; j < this->finishedPlayers.Num(); j++)
				{
					resultsPawn->recordsArray.Add(this->finishedPlayers[j].Key);
					resultsPawn->rankingArray.Add(this->finishedPlayers[j].Value);
				}

				APlayerController* playerController = UGameStateStatics::GetPlayerControllerFromID(UGameStateStatics::controllerIndexes[i]);

				if (playerController != nullptr)
				{
					playerController->AutoReceiveInput = (EAutoReceiveInput::Type)(UGameStateStatics::controllerIndexes[i] + 1);
					playerController->EnableInput(playerController);
					playerController->Possess(resultsPawn);
					playerController->ClientSetHUD(this->resultsHUDclass);
				}
			}

			UGameStateStatics::SaveTrackRecord(this->currentTrack, this->finishedPlayers[0].Key);
			this->raceOver = true;
		}
	}

	if (this->timeRunning && !(this->raceOver))
	{
		this->currentRaceDuration += DeltaSeconds;
	}

	if (this->startingRace)
	{
		this->startingRaceTime += DeltaSeconds;
		if (this->startingRaceTime >= 5.0f)
		{
			for (TArray<ADriverPawn*>::TIterator driverIter(this->driverActors); driverIter; ++driverIter)
			{
				ADriverPawn* currentDriver = *driverIter;
				//currentDriver->controlledVehicle->EnablePhysics();
				//currentDriver->StartRace();
				currentDriver->StartingRace();
				currentDriver->unlockControls = true;
			}
			this->RaceStarted();
			this->startingRace = false;
			this->timeRunning = true;
		}
	}

	if (this->gameStarted)
	{
		this->StartGameInternal(this->numberOfPlayers, this->vehicles, this->drivers);
		this->gameStarted = false;
		this->startingRace = true;
		this->startingRaceTime = 0.0f;
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
	this->driverActors = TArray<ADriverPawn*>();
	this->driverActors.Empty();
	this->finishedPlayers = TArray<TKeyValuePair<float, uint8>>();
	this->finishedPlayers.Empty();

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
			this->driverActors.Add(spawnedDriver);
			spawnedDriver->gameStarterInstance = this;

			FString outString;
			UPlayer* player = world->GetFirstLocalPlayerFromController();
			if (currentPlayer > 0 && GEngine)
			{
				player = GEngine->GameViewport->CreatePlayer(currentPlayer, outString, true);
				//GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
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

			switch (spawnedDriver->controllerIndex)
			{
			case 0:
				spawnedDriver->PlayerMaterialBillboard->SetMaterial(0, this->playerOneMaterial);
				break;
			case 1:
				spawnedDriver->PlayerMaterialBillboard->SetMaterial(0, this->playerTwoMaterial);
				break;
			case 2:
				spawnedDriver->PlayerMaterialBillboard->SetMaterial(0, this->playerThreeMaterial);
				break;
			case 3:
				spawnedDriver->PlayerMaterialBillboard->SetMaterial(0, this->playerFourMaterial);
				break;
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
				//GEngine->AddGamePlayer(GEngine->GameViewport, (ULocalPlayer*)(player));
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
		while (GEngine->GetGamePlayers(GEngine->GameViewport).Num() > 1)
			GEngine->RemoveGamePlayer(GEngine->GameViewport, 1);
	}
}


