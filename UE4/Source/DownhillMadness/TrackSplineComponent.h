#pragma once

#include "GameFramework/Actor.h"
#include "TrackSplineComponent.generated.h"


struct Waypoint
{
	FVector location;
	float distanceFromStart;

	Waypoint(FVector location, float distanceFromStart)
	{
		this->location = location;
		this->distanceFromStart = distanceFromStart;
	}
};

/**
 * 
 */
UCLASS()
class ATrackSplineComponent : public AActor
{
	GENERATED_UCLASS_BODY()

public:

	// Properties

	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = TrackSpline)
	TArray<class ATrackSplineNode*> splineNodes;

	TArray<TArray<Waypoint>> waypoints;

	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = TrackSpline)
	bool ConnectEndPoints;

	UPROPERTY(BlueprintReadOnly, Category = TrackSpline)
	float SplineLength;

	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = TrackSpline)
	bool ShowSplinesInGame;

	// Functions

	/* Calculate point on cubic bezier curve defined by four points */
	UFUNCTION(BlueprintCallable, Category = TrackSpline)
	FVector CalculatePoint(float t, FVector p0, FVector p1, FVector p2, FVector p3);

	/* Draw segment of the spline between two given nodes */
	UFUNCTION(BlueprintCallable, Category = TrackSpline)
	void DrawCurveSegment(FVector p0, FVector p1, FVector p2, FVector p3);

	/* Draw the spline in the viewport by iterating over the respective nodes */
	UFUNCTION(BlueprintCallable, Category = TrackSpline)
	void DrawCurve();

	/* Calculate the total length of the spline */
	UFUNCTION(BlueprintCallable, Category = TrackSpline)
	float ConstructWaypoints();

	/* Calculate the length of a segment of the spline between two given nodes */
	UFUNCTION(BlueprintCallable, Category = TrackSpline)
	float CalculateSplineSegmentLength(ATrackSplineNode* start, ATrackSplineNode* end, float distanceFromStart);

	UFUNCTION(BlueprintCallable, Category = TrackSpline)
	float RelativeSplinePosition(FVector referencePoint);

	virtual void BeginPlay() OVERRIDE;

	virtual void Tick(float DeltaSeconds) OVERRIDE;

	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent) OVERRIDE;

	//virtual void DisplayDebug(UCanvas* Canvas, const class FDebugDisplayInfo& DebugDisplay, float& YL, float& YPos) OVERRIDE;
};
