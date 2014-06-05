

#include "DownhillMadness.h"
#include "VehicleBrakeBase.h"


AVehicleBrakeBase::AVehicleBrakeBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->currentBrake = 0.0f;
	this->currentInput = 0.0f;
	this->maxBrake = 1.0f;
	this->brakeSpeed = 1.0f;
}


// ----------------------------------------------------------------------------


void AVehicleBrakeBase::SetInput(float input)
{
	this->currentInput = FMath::Clamp<float>(input, 0.0f, 1.0f);
}


// ----------------------------------------------------------------------------


float AVehicleBrakeBase::UpdateBrake(float DeltaSeconds)
{
	if (this->currentInput > this->currentBrake)
	{
		this->currentBrake += DeltaSeconds * this->brakeSpeed;

		if (this->currentBrake > this->currentInput)
			this->currentBrake = this->currentInput;
	}
	else
	{
		this->currentBrake = this->currentInput;
	}

	return this->currentBrake;
}


