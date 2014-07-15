

#include "DownhillMadness.h"
#include "SavedVehicle.h"


USavedVehicle::USavedVehicle(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->vehicleData = TArray<uint8>();
	this->vehicleData.Empty();
}


// ----------------------------------------------------------------------------


void USavedVehicle::SetVehicle(const FSerializedVehicle& vehicle)
{
	UVehicleSpawnerLibrary::SaveToArray(vehicle, this->vehicleData);
}


// ----------------------------------------------------------------------------


void USavedVehicle::SetVehicleFromBody(AVehicleBodyBase* vehicle)
{
	FSerializedVehicle serializedVehicle;
	UVehicleSpawnerLibrary::SerializeVehicle(serializedVehicle, vehicle);
	UVehicleSpawnerLibrary::SaveToArray(serializedVehicle, this->vehicleData);
}


// ----------------------------------------------------------------------------


FSerializedVehicle USavedVehicle::GetVehicle()
{
	FSerializedVehicle serializedVehicle;
	UVehicleSpawnerLibrary::LoadFromArray(serializedVehicle, this->vehicleData);
	return serializedVehicle;
}


