

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
	UClass* staticClassInstance;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	uint32 bIsSteerable : 1;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	uint32 bHasBrake : 1;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	FMatrix relativeWheelMatrix;

	FWheelClass();

	FWheelClass(UClass* staticClassInstance, bool bIsSteerable, bool bHasBrake, const FMatrix& relativeWheelMatrix);
};

/**
* @brief	Struct representing a weight class
*/
USTRUCT()
struct FWeightClass
{
	GENERATED_USTRUCT_BODY()

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	UClass* staticClassInstance;

	UPROPERTY(Category = VehicleSpawner, BlueprintReadOnly, VisibleAnywhere)
	FMatrix relativeWeightMatrix;

	FWeightClass();

	FWeightClass(UClass* staticClassInstance, const FMatrix& relativeWeightMatrix);
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
};
