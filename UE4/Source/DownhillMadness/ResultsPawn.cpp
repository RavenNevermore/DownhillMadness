

#include "DownhillMadness.h"
#include "ResultsPawn.h"


AResultsPawn::AResultsPawn(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->RotatingCamera = PCIP.CreateDefaultSubobject<UCameraComponent>(this, FName(TEXT("RotatingCamera")));
	this->RotatingCamera->bUseControllerViewRotation = false;
	this->RotatingCamera->AttachTo(this->FrontArrow);
	this->RotatingCamera->RelativeRotation.Yaw = 180.0f;
}


// ----------------------------------------------------------------------------


void AResultsPawn::BeginPlay()
{
	Super::BeginPlay();

	APlayerController* playerController = Cast<APlayerController>(this->Controller);
	if (playerController != nullptr)
	{
		playerController->ClientSetHUD(this->defaultHUDclass);
	}
}


// ----------------------------------------------------------------------------


void AResultsPawn::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);

	this->RotatingCamera->RelativeRotation.Yaw += DeltaSeconds * 90.0f;
}


