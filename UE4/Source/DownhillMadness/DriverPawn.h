

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
	void ReceiveHit(class UPrimitiveComponent* MyComp, class AActor* Other, class UPrimitiveComponent* OtherComp, bool bSelfMoved, FVector HitLocation, FVector HitNormal, FVector NormalImpulse, const FHitResult& Hit) OVERRIDE;

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
	* @brief	Respawn requested
	*/
	UFUNCTION()
	void OnRespawnRequested();

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

	UFUNCTION(BlueprintImplementableEvent, Category = "Physics|CustomVehicle|DriverPawn")
	void DriverHitSomething(class UPrimitiveComponent* ownComponent, class AActor* otherActor, class UPrimitiveComponent* otherComponent, float hitImpulse, const FHitResult& Hit);

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

	/** Driver anchor */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> DriverAnchor;

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

	/** Driver HUD class */
	UPROPERTY(EditDefaultsOnly, Category = DriverPawn, BlueprintReadOnly)
	UClass* defaultHUDclass;

	/** Particle system used for teleport (player 1) */
	UPROPERTY(EditDefaultsOnly, Category = DriverPawn, BlueprintReadOnly)
	UParticleSystem* teleportParticleSystemP1;

	/** Particle system used for teleport (player 2) */
	UPROPERTY(EditDefaultsOnly, Category = DriverPawn, BlueprintReadOnly)
	UParticleSystem* teleportParticleSystemP2;

	/** Particle system used for teleport (player 3) */
	UPROPERTY(EditDefaultsOnly, Category = DriverPawn, BlueprintReadOnly)
	UParticleSystem* teleportParticleSystemP3;

	/** Particle system used for teleport (player 4) */
	UPROPERTY(EditDefaultsOnly, Category = DriverPawn, BlueprintReadOnly)
	UParticleSystem* teleportParticleSystemP4;

	/** Driver requested respawn */
	UPROPERTY(Category = DriverPawn, EditInstanceOnly, BlueprintReadWrite)
	uint8 controllerIndex;

	/** Driver requested respawn */
	UPROPERTY(Category = DriverPawn, EditInstanceOnly, BlueprintReadWrite)
	uint32 bRespawnRequested : 1;

	/* Reset transform of vehicle */
	UPROPERTY(Category = DriverPawn, EditInstanceOnly, BlueprintReadWrite)
	FTransform checkpointTransform;

	/* Unlock player's controls */
	UPROPERTY(Category = DriverPawn, EditInstanceOnly, BlueprintReadWrite)
	bool unlockControls;

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

	UPROPERTY()
	bool touchedGround;
};
