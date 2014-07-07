

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

				AVehicleWheelBase* vehicleWheel = (AVehicleWheelBase*)(this->GetWorld()->SpawnActor(currentWheel.classInstance, &wheelSpawnPos, &wheelSpawnRotation, spawnParameters));
				if (currentWheel.isSteerable != 0)
					vehicleWheel->bIsSteerable = true;
				else
					vehicleWheel->bIsSteerable = false;
				if (currentWheel.hasBrake != 0)
					vehicleWheel->bHasBrake = true;
				else
					vehicleWheel->bHasBrake = false;

				vehicleBody->AttachWheel(vehicleWheel);
			}

			for (TArray<FWeightClass>::TIterator weightIter(this->weightClasses); weightIter; ++weightIter)
			{
				FWeightClass currentWeight = *weightIter;
				FMatrix weightMatrix = currentWeight.relativeWeightMatrix * bodyMatrix;

				FVector weightSpawnPos = weightMatrix.GetOrigin();
				FRotator weightSpawnRotation = weightMatrix.Rotator();

				AVehicleWeightBase* vehicleWeight = (AVehicleWeightBase*)(this->GetWorld()->SpawnActor(currentWeight.classInstance, &weightSpawnPos, &weightSpawnRotation, spawnParameters));

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


void AVehicleSpawner::SaveLoadData(FArchive& archive)
{
	archive << this->bodyClass;

	int numWheels = this->wheelClasses.Num();
	archive << numWheels;
	this->wheelClasses.Reserve(numWheels);
	for (int i = 0; i < numWheels; i++)
	{
		archive << this->wheelClasses[i];
	}

	int numWeights = this->weightClasses.Num();
	archive << numWeights;
	this->weightClasses.Reserve(numWeights);
	for (int i = 0; i < numWeights; i++)
	{
		archive << this->weightClasses[i];
	}

	archive << this->steeringClass;
	archive << this->brakeClass;
}


// ----------------------------------------------------------------------------


bool AVehicleSpawner::SaveToFile(const FString& filePath)
{
	TArray<uint8> dataArray;
	FObjectWriter archive(this->bodyClass, dataArray, false, false, true);
	this->SaveLoadData(archive);

	if (dataArray.Num() <= 0) return false;

	if (FFileHelper::SaveArrayToFile(dataArray, *filePath))
	{
		archive.FlushCache();
		dataArray.Empty();

		return true;
	}

	archive.FlushCache();
	dataArray.Empty();

	return false;
}


// ----------------------------------------------------------------------------


bool AVehicleSpawner::LoadFromFile(const FString& filePath)
{
	TArray<uint8> binaryArray;

	if (!FFileHelper::LoadFileToArray(binaryArray, *filePath))
	{
		return false;
	}

	if (binaryArray.Num() <= 0) return false;

	FObjectReader archive = FObjectReader(this->bodyClass, binaryArray, false, false);
	archive.Seek(binaryArray.Num());
	this->SaveLoadData(archive);

	archive.FlushCache();

	binaryArray.Empty();
	archive.Close();

	return true;
}


// ----------------------------------------------------------------------------


FWheelClass::FWheelClass()
{
	this->classInstance = nullptr;
	this->isSteerable = 0;
	this->hasBrake = 0;
	this->relativeWheelMatrix = FMatrix::Identity;
}


// ----------------------------------------------------------------------------


FWeightClass::FWeightClass()
{
	this->classInstance = nullptr;
	this->relativeWeightMatrix = FMatrix::Identity;
}


// ----------------------------------------------------------------------------


FWheelClass::FWheelClass(UClass* classInstance, bool bIsSteerable, bool bHasBrake, const FMatrix& relativeWheelMatrix)
{
	this->classInstance = classInstance;
	if (bIsSteerable)
		this->isSteerable = 1;
	else
		this->isSteerable = 0;
	if (bHasBrake)
		this->hasBrake = 1;
	else
		this->hasBrake = 0;
	this->relativeWheelMatrix = relativeWheelMatrix;
}


// ----------------------------------------------------------------------------


FWeightClass::FWeightClass(UClass* classInstance, const FMatrix& relativeWeightMatrix)
{
	this->classInstance = classInstance;
	this->relativeWeightMatrix = relativeWeightMatrix;
}


