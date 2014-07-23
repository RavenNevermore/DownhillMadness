

#pragma once

#include "GameFramework/Actor.h"
#include "ConstructorHelpers.h"
#include "VehicleBodyBase.h"
#include "VehicleWheelBase.h"
#include "VehicleBrakeBase.h"
#include "VehicleSteeringBase.h"
#include "VehicleSpawnerLibrary.generated.h"

class FObjectWriterFix : public FObjectWriter
{
public:
	FObjectWriterFix(TArray<uint8>& InBytes) : FObjectWriter(InBytes)
	{
	}
};

class FObjectReaderFix : public FObjectReader
{
public:
	FObjectReaderFix(TArray<uint8>& InBytes) : FObjectReader(InBytes)
	{
	}

	static UClass* FindClass(const FString& className);
};

/**
* @brief	Struct representing a wheel class
*/
USTRUCT(BlueprintType)
struct FWheelClass
{
	GENERATED_USTRUCT_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	UClass* classInstance;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	uint32 isSteerable;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	uint32 hasBrake;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	FMatrix relativeWheelMatrix;

	FWheelClass();

	FWheelClass(UClass* classInstance, bool bIsSteerable, bool bHasBrake, const FMatrix& relativeWheelMatrix);

	friend FArchive& operator << (FArchive &Ar, FWheelClass& wheelClass)
	{
		if (Ar.IsLoading())
		{
			uint8 classExists;
			Ar << classExists;

			if (classExists != 0)
			{
				FString className;
				Ar << className;
				wheelClass.classInstance = FObjectReaderFix::FindClass(className);
				Ar << wheelClass.isSteerable;
				Ar << wheelClass.hasBrake;
				Ar << wheelClass.relativeWheelMatrix;
			}
		}
		else
		{
			uint8 classExists = 0;
			if (wheelClass.classInstance != nullptr)
				classExists = 1;
			Ar << classExists;

			if (classExists != 0)
			{
				FString className;
				if (wheelClass.classInstance->ClassGeneratedBy != nullptr)
					className = wheelClass.classInstance->ClassGeneratedBy->GetFName().ToString();
				else
					className = wheelClass.classInstance->GetFName().ToString();
				Ar << className;
				Ar << wheelClass.isSteerable;
				Ar << wheelClass.hasBrake;
				Ar << wheelClass.relativeWheelMatrix;
			}
		}

		return Ar;
	}
};

/**
* @brief	Struct representing a weight class
*/
USTRUCT(BlueprintType)
struct FWeightClass
{
	GENERATED_USTRUCT_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	UClass* classInstance;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	FMatrix relativeWeightMatrix;

	FWeightClass();

	FWeightClass(UClass* classInstance, const FMatrix& relativeWeightMatrix);

	friend FArchive& operator << (FArchive &Ar, FWeightClass& weightClass)
	{
		if (Ar.IsLoading())
		{
			uint8 classExists;
			Ar << classExists;

			if (classExists != 0)
			{
				FString className;
				Ar << className;
				weightClass.classInstance = FObjectReaderFix::FindClass(className);
				Ar << weightClass.relativeWeightMatrix;
			}
		}
		else
		{
			uint8 classExists = 0;
			if (weightClass.classInstance != nullptr)
				classExists = 1;
			Ar << classExists;

			if (classExists != 0)
			{
				FString className;
				if (weightClass.classInstance->ClassGeneratedBy != nullptr)
					className = weightClass.classInstance->ClassGeneratedBy->GetFName().ToString();
				else
					className = weightClass.classInstance->GetFName().ToString();
				Ar << className;
				Ar << weightClass.relativeWeightMatrix;
			}
		}

		return Ar;
	}
};

/**
* @brief	Contains information on a serialized vehicle
*/
USTRUCT(BlueprintType)
struct FSerializedVehicle
{
	GENERATED_USTRUCT_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	UClass* bodyClass;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	TArray<FWheelClass> wheelClasses;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	TArray<FWeightClass> weightClasses;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	UClass* steeringClass;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadWrite, EditAnywhere)
	UClass* brakeClass;

	FSerializedVehicle();
};

/**
 * @brief	Function library for serializing and duplicating vehicles
 */
UCLASS(HeaderGroup = KismetLibrary, DependsOn = (AVehicleBodyBase, AVehicleWheelBase, AVehicleWeightBase, AVehicleBrakeBase, AVehicleSteeringBase))
class UVehicleSpawnerLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_UCLASS_BODY()

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner")
	static void SerializeVehicle(FSerializedVehicle& outSerializedVehicle, AVehicleBodyBase* vehicle);

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner", meta = (HidePin = "WorldContextObject", DefaultToSelf = "WorldContextObject"))
	static AVehicleBodyBase* SpawnVehicle(UObject* WorldContextObject, const FSerializedVehicle& inSerializedVehicle, FVector spawnLocation, FRotator spawnRotation);

	static void SaveLoadData(FSerializedVehicle& outSerializedVehicle, FArchive& archive);

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner")
	static bool SaveToFile(const FSerializedVehicle& inSerializedVehicle, const FString& filePath);

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner")
	static bool SaveToArray(const FSerializedVehicle& inSerializedVehicle, TArray<uint8>& binaryArray);

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner")
	static bool LoadFromFile(FSerializedVehicle& outSerializedVehicle, const FString& filePath);

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner")
	static bool LoadFromArray(FSerializedVehicle& outSerializedVehicle, const TArray<uint8>& binaryArray);

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner")
	static void LoadStaticVehicle(FSerializedVehicle& outSerializedVehicle, uint8 index);

	UFUNCTION(BlueprintCallable, Category = "VehicleSpawner")
	static FString GetVehicleName(const FSerializedVehicle& inSerializedVehicle);
};
