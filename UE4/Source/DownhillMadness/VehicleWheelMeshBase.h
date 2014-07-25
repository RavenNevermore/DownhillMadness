

#pragma once

#include "VehicleWheelBase.h"
#include "VehicleWheelMeshBase.generated.h"

/**
 * 
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (AVehicleWheelBase), ShowCategories = ("Actors|CustomVehicle|VehicleWheel"))
class AVehicleWheelMeshBase : public AVehicleWheelBase
{
	GENERATED_UCLASS_BODY()

	void HidePart() OVERRIDE;
	void ShowPart() OVERRIDE;
	void SelectPart() OVERRIDE;
	void DeselectPart() OVERRIDE;

	UPrimitiveComponent* GetRigidBody() OVERRIDE;

	/** Wheel's mesh */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> WheelMesh;
};
