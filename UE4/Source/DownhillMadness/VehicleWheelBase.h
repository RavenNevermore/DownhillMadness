

#pragma once

#include "GameFramework/Actor.h"
#include "WheelConstraint.h"
#include "VehiclePartBase.h"
#include "VehicleWheelBase.generated.h"

/**
 * @brief	Base class for vehicle wheels to be used on vehicle bodies
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DependsOn = (UWheelConstraint, AVehiclePartBase), DefaultToInstanced, ShowCategories = ("Actors|CustomVehicle|VehicleWheel"))
class AVehicleWheelBase : public AVehiclePartBase
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;
	void BeginDestroy() OVERRIDE;
	void ReceiveHit(class UPrimitiveComponent* MyComp, class AActor* Other, class UPrimitiveComponent* OtherComp, bool bSelfMoved, FVector HitLocation, FVector HitNormal, FVector NormalImpulse, const FHitResult& Hit) OVERRIDE;

	/**
	* @brief	Returns UPrimitiveComponent to serve as wheel's base to attach to vehicle body
	* @returns	Wheel's base primitive component
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleWheel")
	virtual UPrimitiveComponent* GetRigidBody() PURE_VIRTUAL(AVehicleWheelBase::GetRigidBody, return nullptr;);

	UFUNCTION()
	void InputFunction(float axisInput);

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Arrow component for wheel axis */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> AxisArrow;

	/** Axis mesh */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> AxisMesh;

	/** Brake mesh */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> BrakeMesh;

	/** Indicates whether this wheel can be steered or not */
	UPROPERTY(Category = VehicleWheel, EditInstanceOnly, BlueprintReadWrite)
	uint32 bIsSteerable : 1;

	/** Indicates whether this wheel has a brake or not */
	UPROPERTY(Category = VehicleWheel, EditInstanceOnly, BlueprintReadWrite)
	uint32 bHasBrake : 1;

	/** Wheel's physics constraint */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UPhysicsConstraintComponent> PhysicsConstraint;

	/** Wheel's wheel constraint */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UWheelConstraint> WheelConstraint;

	/** Wheel's transform relative to root */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleAnywhere)
	FTransform relativeWheelTransform;

	/** Whether wheel is grounded or not */
	UPROPERTY(Category = VehicleWheel, VisibleAnywhere, BlueprintReadOnly)
	bool isGrounded;

	/** 
	* @brief	Prepare wheel for attaching to body
	*/
	UFUNCTION(Category = "Physics|CustomVehicle|VehicleWheel")
	void PrepareAttach();

	/**
	* @brief	Use brake on this wheel
	* @param	brakeValue	Brake value to apply
	*/
	UFUNCTION(Category = "Physics|CustomVehicle|VehicleWheel")
	void BrakeWheel(float brakeValue);
};
