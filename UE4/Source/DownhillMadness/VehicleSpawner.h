

#pragma once

#include "GameFramework/Actor.h"
#include "VehicleBodyBase.h"
#include "VehicleWheelBase.h"
#include "VehicleBrakeBase.h"
#include "VehicleSteeringBase.h"
#include "VehicleSpawner.generated.h"

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
		Ar << wheelClass.classInstance;
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
		Ar << weightClass.classInstance;
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
};
