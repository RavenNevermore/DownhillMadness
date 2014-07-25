

#include "DownhillMadness.h"
#include "VehicleBrakeBase.h"


AVehicleBrakeBase::AVehicleBrakeBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->currentInput = 0.0f;
	this->maxBrake = 1.0f;
	this->brakeSpeed = 1.0f;
}


// ----------------------------------------------------------------------------


void AVehicleBrakeBase::HidePart()
{
}


// ----------------------------------------------------------------------------


void AVehicleBrakeBase::ShowPart()
{
}


// ----------------------------------------------------------------------------


void AVehicleBrakeBase::SetInput(float input)
{
	this->currentInput = FMath::Clamp<float>(input, 0.0f, 1.0f);
}


// ----------------------------------------------------------------------------


float AVehicleBrakeBase::UpdateBrake(float DeltaSeconds, float currentBrake)
{
	if (this->currentInput > currentBrake)
	{
		currentBrake += DeltaSeconds * this->brakeSpeed;

		if (currentBrake > this->currentInput)
			currentBrake = this->currentInput;
	}
	else
	{
		currentBrake = this->currentInput;
	}

	return currentBrake;
}


