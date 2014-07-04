

#pragma once

#include "GameFramework/Pawn.h"
#include "DriverPawn.generated.h"

UENUM()
namespace EDriverPawnState
{
	enum Type
	{
		PushingVehicle,
		JumpingIntoVehicle,
		SteeringVehicle
	};
}


/**
 * @brief	Base class for driver pawns
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (AVehicleBodyBase), ShowCategories = ("Actors|CustomVehicle|DriverPawn"))
class ADriverPawn : public APawn
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;
	void Tick(float DeltaSeconds) OVERRIDE;
	void SetupPlayerInputComponent(class UInputComponent* InputComponent) OVERRIDE;

	/**
	* @brief	Set vehicle to observe/control by this driver
	* @param	vehicle		Driver's vehicle
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|DriverPawn")
	void SetVehicle(AVehicleBodyBase* vehicle);

	/**
	* @brief	Signal character to jump into vehicle and start race
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|DriverPawn")
	void StartRace();

	/**
	* @brief	Get input for steering
	* @param	axisInput	Axis value
	*/
	UFUNCTION()
	void OnGetSteeringInput(float axisInput);

	/**
	* @brief	Get input for brakes
	* @param	axisInput	Axis value
	*/
	UFUNCTION()
	void OnGetBrakeInput(float axisInput);

	/**
	* @brief	Debug reset key pressed
	*/
	UFUNCTION()
	void OnDebugReset();

	/**
	* @brief	Get X axis input for leaning
	* @param	axisInput	Axis value
	*/
	UFUNCTION()
	void OnGetLeanX(float axisInput);

	/**
	* @brief	Get Y axis input for leaning
	* @param	axisInput	Axis value
	*/
	UFUNCTION()
	void OnGetLeanY(float axisInput);

	/**
	* @brief	Make player lean
	* @param	leanX	X axis lean
	* @param	leanY	Y axis lean
	*/
	UFUNCTION()
	void LeanPlayer(float leanX, float leanY);

	/**
	* @brief	Open a level
	* @param	WorldContextObject	World context
	* @param	LevelName	Level to load
	* @param	bAbsolute	Use absolute loading
	* @param	Options	Level load options
	*/
	UFUNCTION()
	void OpenLevel(UObject* WorldContextObject, FName LevelName, bool bAbsolute, FString Options);

	/** The vehicle controlled by this driver */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	AVehicleBodyBase* controlledVehicle;

	/** Input of steering axis */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float steeringAxisInput;

	/** Input of brake axis */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float brakeAxisInput;

	/** X axis input for leaning */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float leaningXInput;

	/** Y axis input for leaning */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float leaningYInput;

	/** Camera stiffness */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float cameraStiffness;

	/** Arrow component for easier orientation */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Camera's rigid body */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USphereComponent> CameraSphere;

	/** Camera observing character */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UCameraComponent> CharacterCamera;

	/** Driver's physics constraint */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UPhysicsConstraintComponent> PhysicsConstraint;

	/** Driver mesh */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USkeletalMeshComponent> DriverSkeletalMesh;

	/** Driver's rigid body */
	UPROPERTY(Category = VehicleWheel, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UCapsuleComponent> DriverCapsule;

	/** Driver's current state */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	TEnumAsByte<EDriverPawnState::Type> driverState;

	/** Maximum power of impulse used for leaning */
	UPROPERTY(EditDefaultsOnly, Category = DriverPawn, BlueprintReadOnly)
	float maxLeaningImpulse;

	/** Driver requested respawn */
	UPROPERTY(Category = DriverPawn, EditInstanceOnly, BlueprintReadWrite)
	uint32 bRespawnRequested : 1;

private:
	/** Old X axis input for leaning */
	UPROPERTY()
	float leaningXInputOld;

	/** =ld Y axis input for leaning */
	UPROPERTY()
	float leaningYInputOld;

	/* Camera anchor */
	UPROPERTY()
	FVector cameraAnchor;

	/* Old driver location */
	UPROPERTY()
	FVector driverOldLocation;

	/* Old driver rotation */
	UPROPERTY()
	FRotator driverOldRotation;

	/* Distance of camera when in air */
	UPROPERTY()
	FVector cameraAirDifference;

	/* Reset transform of vehicle */
	UPROPERTY()
	FTransform checkpointTransform;

	UPROPERTY()
	bool hasTransformed;
};
