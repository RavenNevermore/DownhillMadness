

#include "DownhillMadness.h"
#include "VehicleSteeringBase.h"


AVehicleSteeringBase::AVehicleSteeringBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->SteeringWheelPos = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("SteeringWheelPos")));
	this->SteeringWheelPos->AttachTo(this->FrontArrow);

	this->SteeringWheelPivot = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("SteeringWheelPivot")));
	this->SteeringWheelPivot->AttachTo(this->SteeringWheelPos);

	this->SteeringMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("SteeringMesh")));
	this->SteeringMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->SteeringMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->SteeringMesh->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->SteeringMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->SteeringMesh->SetSimulatePhysics(false);
	this->SteeringMesh->bAbsoluteScale = true;
	this->SteeringMesh->AttachTo(this->SteeringWheelPivot);

	this->currentSteering = 0.0f;
	this->maxSteeringDegree = 30.0f;
	this->steeringSpeed = 90.0f;
	this->steeringSnapBackSpeed = 270.0f;
	this->maxSteeringWheelRotation = 75.0f;
}


// ----------------------------------------------------------------------------


void AVehicleSteeringBase::HidePart()
{
	this->SteeringMesh->SetHiddenInGame(true, false);
	this->SteeringMesh->SetVisibility(false, false);
}


// ----------------------------------------------------------------------------


void AVehicleSteeringBase::ShowPart()
{
	this->SteeringMesh->SetHiddenInGame(false, false);
	this->SteeringMesh->SetVisibility(true, false);
}


// ----------------------------------------------------------------------------


void AVehicleSteeringBase::SetInput(float input)
{
	this->currentInput = FMath::Clamp<float>(input, -1.0f, 1.0f);
}


// ----------------------------------------------------------------------------


float AVehicleSteeringBase::UpdateSteering(float DeltaSeconds)
{
	if (this->currentSteering < this->currentInput * this->maxSteeringDegree)
	{
		// Move clockwise
		if (this->currentSteering < 0.0f)
		{
			// Use fast steering speed
			if (this->currentSteering + (DeltaSeconds * this->steeringSnapBackSpeed) >= 0.0f)
			{
				// ...but we are too far, so only use part of it
				float beyondZero = (this->currentSteering + (DeltaSeconds * this->steeringSnapBackSpeed)) / (DeltaSeconds * this->steeringSnapBackSpeed);
				this->currentSteering = 0.0f + (beyondZero * DeltaSeconds * this->steeringSpeed);
			}
			else
				// Use regular steering speed
				this->currentSteering += DeltaSeconds * this->steeringSnapBackSpeed;
		}
		else
			this->currentSteering += DeltaSeconds * this->steeringSpeed;

		if (this->currentSteering > this->currentInput * this->maxSteeringDegree)
			this->currentSteering = this->currentInput * this->maxSteeringDegree;
	}
	else
	{
		// Move counter-clockwise
		if (this->currentSteering > 0.0f)
		{
			// Use fast steering speed
			if (this->currentSteering - (DeltaSeconds * this->steeringSnapBackSpeed) <= 0.0f)
			{
				// ...but we are too far, so only use part of it
				float beyondZero = (this->currentSteering - (DeltaSeconds * this->steeringSnapBackSpeed)) / -(DeltaSeconds * this->steeringSnapBackSpeed);
				this->currentSteering = 0.0f - (beyondZero * DeltaSeconds * this->steeringSpeed);
			}
			else
				this->currentSteering -= DeltaSeconds * this->steeringSnapBackSpeed;
		}
		else
			// Use regular steering speed
			this->currentSteering -= DeltaSeconds * this->steeringSpeed;

		if (this->currentSteering < this->currentInput * this->maxSteeringDegree)
			this->currentSteering = this->currentInput * this->maxSteeringDegree;
	}

	this->SteeringWheelPivot->RelativeRotation.Roll = (this->currentSteering / this->maxSteeringDegree) * this->maxSteeringWheelRotation;

	return this->currentSteering;
}
