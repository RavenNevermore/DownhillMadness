

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleBodyBase.h"
#include "VehicleWheelBase.h"
#include "VehicleBrakeBase.h"
#include "VehicleSteeringBase.h"
#include "VehicleSpawner.generated.h"

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
USTRUCT()
struct FWheelClass
{
	GENERATED_USTRUCT_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	UClass* classInstance;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	uint32 isSteerable;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	uint32 hasBrake;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	FMatrix relativeWheelMatrix;

	FWheelClass();

	FWheelClass(UClass* classInstance, bool bIsSteerable, bool bHasBrake, const FMatrix& relativeWheelMatrix);

	friend FArchive& operator << (FArchive &Ar, FWheelClass& wheelClass)
	{
		if (Ar.IsLoading())
		{
			FString className;
			Ar << className;
			wheelClass.classInstance = FObjectReaderFix::FindClass(className);
		}
		else
		{
			FString className = wheelClass.classInstance->GetFName().ToString();
			Ar << className;
		}

		Ar << wheelClass.isSteerable;
		Ar << wheelClass.hasBrake;
		Ar << wheelClass.relativeWheelMatrix;

		return Ar;
	}
};

/**
* @brief	Struct representing a weight class
*/
USTRUCT()
struct FWeightClass
{
	GENERATED_USTRUCT_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	UClass* classInstance;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	FMatrix relativeWeightMatrix;

	FWeightClass();

	FWeightClass(UClass* classInstance, const FMatrix& relativeWeightMatrix);

	friend FArchive& operator << (FArchive &Ar, FWeightClass& weightClass)
	{
		if (Ar.IsLoading())
		{
			FString className;
			Ar << className;
			weightClass.classInstance = FObjectReaderFix::FindClass(className);
		}
		else
		{
			FString className = weightClass.classInstance->GetFName().ToString();
			Ar << className;
		}

		Ar << weightClass.relativeWeightMatrix;

		return Ar;
	}
};

/**
 * @brief	Class for serializing and duplicating complete vehicles
 */
UCLASS(ClassGroup = CustomVehicle, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (AVehicleBodyBase, AVehicleWheelBase, AVehicleWeightBase, AVehicleBrakeBase, AVehicleSteeringBase), ShowCategories = ("Actors|CustomVehicle|VehicleSpawner"))
class AVehicleSpawner : public AActor
{
	GENERATED_UCLASS_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> Root;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	UClass* bodyClass;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	TArray<FWheelClass> wheelClasses;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	TArray<FWeightClass> weightClasses;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	UClass* steeringClass;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	UClass* brakeClass;

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSpawner")
	void SerializeVehicle(AVehicleBodyBase* vehicle);

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSpawner")
	AVehicleBodyBase* SpawnVehicle(FVector spawnLocation, FRotator spawnRotation);

	void SaveLoadData(FArchive& archive);

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSpawner")
	bool SaveToFile(const FString& filePath);

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSpawner")
	bool LoadFromFile(const FString& filePath);

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSpawner")
	bool LoadFromArray(const TArray<uint8>& binaryArray);

	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleSpawner")
	void LoadStaticVehicle(uint8 index);
};
