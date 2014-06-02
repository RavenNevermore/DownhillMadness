

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
	* @float	Axis value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|DriverPawn")
	void OnGetSteeringInput(float axisInput);

	/**
	* @brief	Get input for brakes
	* @float	Axis value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|DriverPawn")
	void OnGetBrakeInput(float axisInput);

	/** The vehicle controlled by this driver */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	AVehicleBodyBase* controlledVehicle;

	/** Input of steering axis */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float steeringAxisInput;

	/** Input of brake axis */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float brakeAxisInput;

	/** Camera stiffness */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	float cameraStiffness;

	/** Arrow component for easier orientation */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Spring arm for camera */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USpringArmComponent> CameraSpringArm;

	/** Camera observing character */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UCameraComponent> CharacterCamera;

	/** Driver's physics constraint */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UPhysicsConstraintComponent> PhysicsConstraint;

	/** Driver mesh */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> DriverMesh;

	/** Driver's current state */
	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleAnywhere)
	TEnumAsByte<EDriverPawnState::Type> driverState;
};
