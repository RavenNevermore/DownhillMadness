

#pragma once

#include "GameFramework/Actor.h"
#include "TrackSplineNode.generated.h"

/**
 * 
 */
UCLASS()
class ATrackSplineNode : public AActor
{
	GENERATED_UCLASS_BODY()

public:

	// Properties

	FVector back;

	FVector front;

	/* Rotation of the tangent pointing to the last node */
	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = TrackSplineNode)
	FRotator backRotation;

	/* Rotation of the tangent pointing to the next node */
	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = TrackSplineNode)
	FRotator frontRotation;

	/* Length of the tangent pointing to the last node */
	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = TrackSplineNode)
	float backStretchValue;

	/* Length of the tangent pointing to the next node */
	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = TrackSplineNode)
	float frontStrechValue;

	TSubobjectPtr<class USphereComponent> pin;

	// Functions

	virtual void Tick(float DeltaSeconds) OVERRIDE;

	virtual void OnConstruction(const FTransform& Transform) OVERRIDE;

	virtual void EditorApplyTranslation(const FVector& DeltaTranslation, bool bAltDown, bool bShiftDown, bool bCtrlDown) OVERRIDE;
};
