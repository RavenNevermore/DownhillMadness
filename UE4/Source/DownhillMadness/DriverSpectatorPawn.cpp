

#include "DownhillMadness.h"
#include "DriverSpectatorPawn.h"


ADriverSpectatorPawn::ADriverSpectatorPawn(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->SpectatorCamera = PCIP.CreateDefaultSubobject<UCameraComponent>(this, FName(TEXT("SpectatorCamera")));
	this->SpectatorCamera->bUseControllerViewRotation = false;
	this->RootComponent = this->SpectatorCamera;
}


