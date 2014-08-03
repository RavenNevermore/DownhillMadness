

#pragma once

#include "GameFramework/Actor.h"
#include "WheelConstraint.h"
#include "VehiclePartBase.h"
#include "VehicleWheelBase.h"
#include "VehicleBodyBase.generated.h"


/**
* @brief	Struct for vehicle error checking
*/
USTRUCT(BlueprintType)
struct FVehicleErrorCheck
{
	GENERATED_USTRUCT_BODY()

	UPROPERTY(Category = VehicleBody, BlueprintReadWrite, EditAnywhere)
	bool hasNoWheels;

	UPROPERTY(Category = VehicleBody, BlueprintReadWrite, EditAnywhere)
	bool hasNoSteerableWheels;

	UPROPERTY(Category = VehicleBody, BlueprintReadWrite, EditAnywhere)
	bool hasNoBrakesOnWheels;

	UPROPERTY(Category = VehicleBody, BlueprintReadWrite, EditAnywhere)
	bool hasNoBrakes;

	UPROPERTY(Category = VehicleBody, BlueprintReadWrite, EditAnywhere)
	bool hasNoSteeringSystem;

	UPROPERTY(Category = VehicleBody, BlueprintReadWrite, EditAnywhere)
	bool noErrors;

	FVehicleErrorCheck();
};

/**
 * @brief	Base class for vehicle bodies that manages and communicates with all other vehicle components
 */
UCLASS(ClassGroup = CustomVehicle, Abstract, Blueprintable, BlueprintType, DefaultToInstanced, DependsOn = (UWheelConstraint, AVehiclePartBase, AVehicleWheelBase, AVehicleWheelCapsuleBase, AVehicleWheelMeshBase, AVehicleWeightBase, AVehicleBrakeBase, AVehicleSteeringBase), ShowCategories = ("Actors|CustomVehicle|VehicleBody"))
class AVehicleBodyBase : public AVehiclePartBase
{
	GENERATED_UCLASS_BODY()

	void HidePart() OVERRIDE;
	void ShowPart() OVERRIDE;
	void SelectPart() OVERRIDE;
	void DeselectPart() OVERRIDE;
	void ReceiveHit(class UPrimitiveComponent* MyComp, class AActor* Other, class UPrimitiveComponent* OtherComp, bool bSelfMoved, FVector HitLocation, FVector HitNormal, FVector NormalImpulse, const FHitResult& Hit) OVERRIDE;

	void BeginPlay() OVERRIDE;
	void Tick(float DeltaSeconds) OVERRIDE;
	
	/**
	* @brief	Set transparency on body
	* @param	bMakeTransparent	Whether to make transparent or opaque
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void SetTransparent(bool bMakeTransparent);

	/**
	* @brief	Update controls of this vehicle
	* @param	DeltaSeconds		Delta time since previous frame
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void UpdateControls(float DeltaSeconds);

	/**
	* @brief	Attach wheel to vehicle body
	* @param	wheel		Wheel to attach body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AttachWheel(AVehicleWheelBase* wheel);

	/**
	* @brief	Detach wheel from vehicle body
	* @param	wheel		Wheel to detach from body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool DetachWheel(AVehicleWheelBase* wheel);

	/**
	* @brief	Attach weight to vehicle body
	* @param	weight		Weight to attach body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AttachWeight(AVehicleWeightBase* weight);

	/**
	* @brief	Detach weight from vehicle body
	* @param	weight		Weight to detach from body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool DetachWeight(AVehicleWeightBase* weight);

	/**
	* @brief	Attach steering system to vehicle body
	* @param	steering		Steering system to attach body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AttachSteering(AVehicleSteeringBase* steering);

	/**
	* @brief	Detach steering system from vehicle body
	* @param	steering		Steering system to detach from body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool DetachSteering(AVehicleSteeringBase* steering);

	/**
	* @brief	Attach brake system to vehicle body
	* @param	brake		Brake system to attach body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AttachBrake(AVehicleBrakeBase* brake);

	/**
	* @brief	Detach brake system from vehicle body
	* @param	brake		Brake system to detach from body
	* @returns	True if successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool DetachBrake(AVehicleBrakeBase* brake);

	/**
	* @brief	Set input for steering system
	* @param	input		Input value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void SetSteeringInput(float input);

	/**
	* @brief	Set input for brakes
	* @param	input		Input value
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void SetBrakeInput(float input);

	/**
	* @brief	Enable physics on this body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void EnablePhysics();

	/**
	* @brief	Disable physics on this body
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void DisablePhysics();

	/**
	* @brief	Align wheel to vehicle's bounding box and check if wheel can be attached
	* @param	wheel	Wheel to test
	* @param	minDistance	Minimum distance of wheel from bounding box
	* @param	maxDistance	Maximum distance of wheel from bounding box
	* @param	newTransform	New projected wheel transform
	* @returns	True if wheel can be placed
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AlignWheel(AVehicleWheelBase* wheel, float minDistance, float maxDistance, FTransform& newTransform);

	/**
	* @brief	Align weight to vehicle's bounding box and check if weight can be attached
	* @param	weight	Weight to test
	* @param	minDistance	Minimum distance of weight from bounding box
	* @param	maxDistance	Maximum distance of weight from bounding box
	* @param	newTransform	New projected weight transform
	* @returns	True if weight can be placed
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool AlignWeight(AVehicleWeightBase* weight, float minDistance, float maxDistance, FTransform& newTransform);

	/**
	* @brief	Snap a wheel to vehicle's bounding box
	* @param	wheel	Wheel to snap to vehicle
	* @param	newTransform	New transform of wheel
	* @returns	True if snapping was successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool SnapWheel(AVehicleWheelBase* wheel, FTransform& newTransform, FVector snapDirection = FVector::ZeroVector);

	/**
	* @brief	Snap a weight to vehicle's bounding box
	* @param	weight	Wheight to snap to vehicle
	* @param	newTransform	New transform of weight
	* @returns	True if snapping was successful
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	bool SnapWeight(AVehicleWeightBase* weight, FTransform& newTransform, FVector snapDirection = FVector::ZeroVector);

	/**
	* @brief	Tries to find vehicle's first vehicle part on a line
	* @param	startPos	The start position
	* @param	traceDirection	The direction of the LinceTrace
	* @returns	The first part found or null otherwise
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	AVehiclePartBase* GetFirstPartInLine(const FVector& startPos, const FVector& traceDirection);

	/**
	* @brief	Check this vehicle for errors
	* @returns	All errors found
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	FVehicleErrorCheck CheckVehicleForErrors();

	/**
	* @brief	Destroys this vehicle and all of its parts
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void DestroyVehicle();

	/**
	* @brief	Get body's audio properties
	* @param	onGround	Is vehicle touching ground?
	* @param	currentSpeed	Current vehicle speed
	*/
	UFUNCTION(BlueprintCallable, Category = "Physics|CustomVehicle|VehicleBody")
	void GetAudioProperties(bool& onGround, float& currentSpeed);

	UFUNCTION(BlueprintImplementableEvent, Category = "Physics|CustomVehicle|VehicleBody")
	void VehicleHitSomething(class UPrimitiveComponent* ownComponent, class AActor* otherActor, class UPrimitiveComponent* otherComponent, float hitImpulse, const FHitResult& Hit);

	/** Body's audio component */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UAudioComponent> AudioComponent;

	/** Body's mesh */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> Body;

	/** Body's complex collision mesh for snapping */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UStaticMeshComponent> ComplexBody;

	/** Base for attach parts by raycast */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UBoxComponent> RaycastBase;

	/** Arrow component for easier orientation */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	/** Array of attached wheels */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	TArray<AVehicleWheelBase*> attachedWheels;

	/** Array of attached weights */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	TArray<AVehicleWeightBase*> attachedWeights;

	/** Attached steering system */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	AVehicleSteeringBase* attachedSteering;

	/** Attached brake system */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, VisibleAnywhere)
	AVehicleBrakeBase* attachedBrake;

	/** Transparent body material */
	UPROPERTY(Category = VehicleBody, BlueprintReadOnly, EditDefaultsOnly)
	UMaterialInterface* transparentMaterial;

private:
	/**
	* @brief	Align a vehicle part to vehicle's bounding box and check if it can be attached
	* @param	inTransform	Base transform of vehicle part
	* @param	minDistance	Minimum distance of vehicle part from bounding box
	* @param	maxDistance	Maximum distance of vehicle part from bounding box
	* @param	newTransform	New projected vehicle part transform
	* @returns	True if vehicle part can be placed
	*/
	UFUNCTION()
	bool AlignPart(const FTransform& inTransform, float minDistance, float maxDistance, FTransform& newTransform);

	/**
	* @brief	Snap a vehicle part to vehicle's bounding box
	* @param	inTransform	Transform of vehicle part's snap pivot
	* @param	newTransform	New transform of vehicle part's snap pivot 
	* @returns	True if snapping was successful
	*/
	UFUNCTION()
	bool SnapPart(const FTransform& inTransform, FTransform& newTransform, const FVector& snapDirection);

	UMaterialInterface* regularMaterial;
};
