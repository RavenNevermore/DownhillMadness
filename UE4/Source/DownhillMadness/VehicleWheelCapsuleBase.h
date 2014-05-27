

#pragma once

#include "VehicleWheelBase.h"
#include "VehicleWheelCapsuleBase.generated.h"

/**
 * 
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (AVehicleWheelBase), ShowCategories = ("Actors|CustomVehicle|VehicleWheel"))
class AVehicleWheelCapsuleBase : public AVehicleWheelBase
{
	GENERATED_UCLASS_BODY()

	UPrimitiveComponent* GetRigidBody() OVERRIDE;

	/** Wheel's rigid body */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UCapsuleComponent> WheelCapsule;

	/** Wheel's mesh */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> WheelMesh;
};
