

#include "DownhillMadness.h"
#include "VehicleSteeringBase.h"


AVehicleSteeringBase::AVehicleSteeringBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->SteeringMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("SteeringMesh")));
	this->SteeringMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->SteeringMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->SteeringMesh->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->SteeringMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->SteeringMesh->SetSimulatePhysics(false);
	this->SteeringMesh->bAbsoluteScale = true;
	this->SteeringMesh->AttachTo(this->FrontArrow);

	this->currentSteering = 0.0f;
	this->maxSteeringDegree = 30.0f;
	this->steeringSpeed = 3600.0f;
	this->steeringSnapBackSpeed = 3600.0f;
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
		if (this->currentSteering < 0.0f)
			this->currentSteering += DeltaSeconds * this->steeringSnapBackSpeed;
		else
			this->currentSteering += DeltaSeconds * this->steeringSpeed;

		if (this->currentSteering > this->currentInput * this->maxSteeringDegree)
			this->currentSteering = this->currentInput * this->maxSteeringDegree;
	}
	else
	{
		if (this->currentSteering > 0.0f)
			this->currentSteering -= DeltaSeconds * this->steeringSnapBackSpeed;
		else
			this->currentSteering -= DeltaSeconds * this->steeringSpeed;

		if (this->currentSteering < this->currentInput * this->maxSteeringDegree)
			this->currentSteering = this->currentInput * this->maxSteeringDegree;
	}

	return this->currentSteering;
}
