

#include "DownhillMadness.h"
#include "GameStarter.h"


AGameStarter::AGameStarter(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->Root = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("Root")));
	this->RootComponent = this->Root;

	this->numberOfPlayers = 1;
}


// ----------------------------------------------------------------------------


void AGameStarter::BeginPlay()
{
	Super::BeginPlay();

	TActorIterator<ASpawnPoint> spawnPoints = TActorIterator<ASpawnPoint>(this->GetWorld());
	uint8 currentPlayer = 0;

	while (spawnPoints && currentPlayer < this->numberOfPlayers)
	{
		currentPlayer++;
	}
}


