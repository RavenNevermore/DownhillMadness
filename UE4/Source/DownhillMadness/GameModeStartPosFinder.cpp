

#include "DownhillMadness.h"
#include "GameModeStartPosFinder.h"


AGameModeStartPosFinder::AGameModeStartPosFinder(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
}


// ----------------------------------------------------------------------------


void AGameModeStartPosFinder::BeginPlay()
{
	Super::BeginPlay();
}


// ----------------------------------------------------------------------------


AActor* AGameModeStartPosFinder::ChoosePlayerStart(AController* Player)
{
	if (this->PlayerStarts.Num() > 0)
	{
		APlayerStart* PlayerStart = this->PlayerStarts[this->currentPlayerIndex % this->PlayerStarts.Num()];
		this->currentPlayerIndex++;
		return PlayerStart;
	}

	return nullptr;
}