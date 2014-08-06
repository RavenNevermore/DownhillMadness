

#include "DownhillMadness.h"
#include "ResultsPawn.h"


AResultsPawn::AResultsPawn(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->CameraSocket = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("CameraSocket")));
	this->CameraSocket->AttachTo(this->FrontArrow);

	this->RotatingCamera = PCIP.CreateDefaultSubobject<UCameraComponent>(this, FName(TEXT("RotatingCamera")));
	this->RotatingCamera->bUseControllerViewRotation = false;
	this->RotatingCamera->RelativeRotation.Yaw = 180.0f;
	this->RotatingCamera->RelativeRotation.Pitch = -15.0f;
	this->RotatingCamera->RelativeLocation.X = 600.0f;
	this->RotatingCamera->AttachTo(this->CameraSocket);

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void AResultsPawn::BeginPlay()
{
	Super::BeginPlay();
}


// ----------------------------------------------------------------------------


void AResultsPawn::SetupPlayerInputComponent(class UInputComponent* InputComponent)
{
	check(InputComponent);
	InputComponent->BindAction("EndRaceButton", EInputEvent::IE_Pressed, this, &AResultsPawn::EndRaceButton).bConsumeInput = false;
}


// ----------------------------------------------------------------------------


void AResultsPawn::EndRaceButton()
{

}


// ----------------------------------------------------------------------------


void AResultsPawn::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);

	FRotator updatedRotation = this->CameraSocket->RelativeRotation;
	updatedRotation.Yaw += (DeltaSeconds * -45.0f);
	this->CameraSocket->SetRelativeRotation(updatedRotation, false);
}


