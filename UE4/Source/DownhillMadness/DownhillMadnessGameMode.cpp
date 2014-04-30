

#include "DownhillMadness.h"
#include "DownhillMadnessGameMode.h"
#include "DownhillMadnessPlayerController.h"

ADownhillMadnessGameMode::ADownhillMadnessGameMode(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	PlayerControllerClass = ADownhillMadnessPlayerController::StaticClass();
}


