

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
	void SetupPlayerInputComponent(class UInputComponent* InputComponent) OVERRIDE;
	void Tick(float DeltaSeconds) OVERRIDE;

	void EndRaceButton();

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UArrowComponent> FrontArrow;

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class USceneComponent> CameraSocket;

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleDefaultsOnly)
	TSubobjectPtr<class UCameraComponent> RotatingCamera;

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleInstanceOnly)
	float playerTime;

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleInstanceOnly)
	uint8 ranking;

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleInstanceOnly)
	bool raceOver;

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleInstanceOnly)
	TArray<uint8> rankingArray;

	UPROPERTY(Category = ResultsPawn, BlueprintReadOnly, VisibleInstanceOnly)
	TArray<float> recordsArray;
};
