

#include "DownhillMadness.h"
#include "VehicleSpawner.h"


AVehicleSpawner::AVehicleSpawner(const class FPostConstructInitializeProperties& PCIP)
: Super(PCIP)
{
	this->Root = PCIP.CreateDefaultSubobject<USceneComponent>(this, FName(TEXT("Root")));
	this->RootComponent = this->Root;

	this->bodyClass = nullptr;
	this->wheelClasses = TArray<FWheelClass>();
	this->wheelClasses.Empty();
	this->weightClasses = TArray<FWeightClass>();
	this->weightClasses.Empty();
	this->steeringClass = nullptr;
	this->brakeClass = nullptr;
}


// ----------------------------------------------------------------------------


void AVehicleSpawner::SerializeVehicle(AVehicleBodyBase* vehicle)
{
	if (vehicle == nullptr)
		return;

	this->bodyClass = vehicle->GetClass();
	FMatrix bodyMatrix = vehicle->Body->GetComponenTransform().ToMatrixNoScale();

	for (TArray<AVehicleWheelBase*>::TIterator wheelIter(vehicle->attachedWheels); wheelIter; ++wheelIter)
	{
		AVehicleWheelBase* currentWheel = *wheelIter;
		FMatrix wheelMatrix = currentWheel->WheelConstraint->GetComponenTransform().ToMatrixNoScale();
		FMatrix relativeMatrix = wheelMatrix * bodyMatrix.InverseSafe();

		this->wheelClasses.Add(FWheelClass(currentWheel->GetClass(), currentWheel->bIsSteerable, currentWheel->bHasBrake, relativeMatrix));
	}

	for (TArray<AVehicleWeightBase*>::TIterator weightIter(vehicle->attachedWeights); weightIter; ++weightIter)
	{
		AVehicleWeightBase* currentWeight = *weightIter;
		FMatrix weightMatrix = currentWeight->PhysicsConstraint->GetComponenTransform().ToMatrixNoScale();
		FMatrix relativeMatrix = weightMatrix * bodyMatrix.InverseSafe();

		this->weightClasses.Add(FWeightClass(currentWeight->GetClass(), relativeMatrix));
	}

	if (vehicle->attachedSteering != nullptr)
		this->steeringClass = vehicle->attachedSteering->GetClass();

	if (vehicle->attachedBrake != nullptr)
		this->brakeClass = vehicle->attachedBrake->GetClass();
}


// ----------------------------------------------------------------------------


AVehicleBodyBase* AVehicleSpawner::SpawnVehicle(FVector spawnLocation, FRotator spawnRotation)
{
	if (this->bodyClass != nullptr)
	{
		FActorSpawnParameters spawnParameters;

		AVehicleBodyBase* vehicleBody = (AVehicleBodyBase*)(this->GetWorld()->SpawnActor(this->bodyClass, &spawnLocation, &spawnRotation, spawnParameters));

		if (vehicleBody != nullptr)
		{
			FMatrix bodyMatrix = FRotationTranslationMatrix(spawnRotation, spawnLocation);

			for (TArray<FWheelClass>::TIterator wheelIter(this->wheelClasses); wheelIter; ++wheelIter)
			{
				FWheelClass currentWheel = *wheelIter;
				FMatrix wheelMatrix = currentWheel.relativeWheelMatrix * bodyMatrix;

				FVector wheelSpawnPos = wheelMatrix.GetOrigin();
				FRotator wheelSpawnRotation = wheelMatrix.Rotator();

				AVehicleWheelBase* vehicleWheel = (AVehicleWheelBase*)(this->GetWorld()->SpawnActor(currentWheel.staticClassInstance, &wheelSpawnPos, &wheelSpawnRotation, spawnParameters));
				vehicleWheel->bIsSteerable = currentWheel.bIsSteerable;
				vehicleWheel->bHasBrake = currentWheel.bHasBrake;

				vehicleBody->AttachWheel(vehicleWheel);
			}

			for (TArray<FWeightClass>::TIterator weightIter(this->weightClasses); weightIter; ++weightIter)
			{
				FWeightClass currentWeight = *weightIter;
				FMatrix weightMatrix = currentWeight.relativeWeightMatrix * bodyMatrix;

				FVector weightSpawnPos = weightMatrix.GetOrigin();
				FRotator weightSpawnRotation = weightMatrix.Rotator();

				AVehicleWeightBase* vehicleWeight = (AVehicleWeightBase*)(this->GetWorld()->SpawnActor(currentWeight.staticClassInstance, &weightSpawnPos, &weightSpawnRotation, spawnParameters));

				vehicleBody->AttachWeight(vehicleWeight);
			}

			if (this->steeringClass != nullptr)
			{
				AVehicleSteeringBase* vehicleSteering = (AVehicleSteeringBase*)(this->GetWorld()->SpawnActor(this->steeringClass, &spawnLocation, &spawnRotation, spawnParameters));
				vehicleBody->AttachSteering(vehicleSteering);
			}

			if (this->brakeClass != nullptr)
			{
				AVehicleBrakeBase* vehicleBrake = (AVehicleBrakeBase*)(this->GetWorld()->SpawnActor(this->brakeClass, &spawnLocation, &spawnRotation, spawnParameters));
				vehicleBody->AttachBrake(vehicleBrake);
			}

			return vehicleBody;
		}
	}

	return nullptr;
}


// ----------------------------------------------------------------------------


FWheelClass::FWheelClass()
{
	this->staticClassInstance = nullptr;
	this->bIsSteerable = false;
	this->bHasBrake = false;
	this->relativeWheelMatrix = FMatrix::Identity;
}


// ----------------------------------------------------------------------------


FWeightClass::FWeightClass()
{
	this->staticClassInstance = nullptr;
	this->relativeWeightMatrix = FMatrix::Identity;
}


// ----------------------------------------------------------------------------


FWheelClass::FWheelClass(UClass* staticClassInstance, bool bIsSteerable, bool bHasBrake, const FMatrix& relativeWheelMatrix)
{
	this->staticClassInstance = staticClassInstance;
	this->bIsSteerable = bIsSteerable;
	this->bHasBrake = bHasBrake;
	this->relativeWheelMatrix = relativeWheelMatrix;
}


// ----------------------------------------------------------------------------


FWeightClass::FWeightClass(UClass* staticClassInstance, const FMatrix& relativeWeightMatrix)
{
	this->staticClassInstance = staticClassInstance;
	this->relativeWeightMatrix = relativeWeightMatrix;
}


