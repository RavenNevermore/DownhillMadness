

#pragma once

#include "GameFramework/Pawn.h"
#include "ResultsPawn.generated.h"

/**
 * 
 */
UCLASS()
class AResultsPawn : public APawn
{
	GENERATED_UCLASS_BODY()

	void BeginPlay() OVERRIDE;
	void Tick(float DeltaSeconds) OVERRIDE;

	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> CameraSocket;

	UPROPERTY(Category = DriverPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UCameraComponent> RotatingCamera;

	float playerTime;
	uint8 ranking;
};
