#include "DownhillMadness.h"
#include "TrackSplineComponent.h"
#include "TrackSplineNode.h"

/* Default UE4 constructor */
ATrackSplineComponent::ATrackSplineComponent(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	/* Enable ticking */
	PrimaryActorTick.bCanEverTick = true;
	/* Set spline endpoints to be connected (e.g. for circle-courses) */
	this->ConnectEndPoints = false;
}

/* Calculate point on cubic bezier curve defined by four points */
FVector ATrackSplineComponent::CalculatePoint(float t, FVector start, FVector startTangent, FVector endTangent, FVector end)
{
	float u = 1 - t;
	float tt = t * t;
	float uu = u * u;
	float uuu = uu * u;
	float ttt = tt * t;

	FVector p = uuu * start;
	p += 3 * uu * t * startTangent;
	p += 3 * u * tt * endTangent;
	p += ttt * end;

	return p;
}

/* Draw the spline in the viewport by iterating over the respective nodes */
void ATrackSplineComponent::DrawCurve()
{
	//this->waypoints.Empty();
	ATrackSplineNode* start = *(this->splineNodes.GetTypedData());
	for (TArray<class ATrackSplineNode*>::TIterator iter = this->splineNodes.CreateIterator(); iter; iter++)
	{
		if (!(*iter)) continue;
		if (start == *iter)
		{
			// Draw a connection between first and last node if ConnectEndPoints is true, else skip to next iteration
			if(!this->ConnectEndPoints) continue;
			ATrackSplineNode* end = this->splineNodes.Last();
			DrawCurveSegment(start->GetActorLocation(), start->front, end->back, end->GetActorLocation());
		}
		else
		{
			ATrackSplineNode* end = *iter;
			DrawCurveSegment(start->GetActorLocation(), start->front, end->back, end->GetActorLocation());
			start = end;
		}
	}

	/*for (TArray<TArray<Waypoint>>::TIterator segments = this->waypoints.CreateIterator(); segments; segments++)
	{
		for (TArray<Waypoint>::TIterator segment = (*segments).CreateIterator(); segment; segment++)
		{
			DrawDebugLine(this->GetWorld(), (*segment).location, (*segment).location + FVector(2, 2, 2), FColor::Cyan, false, -1, 0, 8);
		}
	}*/
}

/* Draw segment of the spline between two given nodes */
void ATrackSplineComponent::DrawCurveSegment(FVector p0, FVector p1, FVector p2, FVector p3)
{
	float distance = FVector::Dist(p0, p3);
	int32 roundedDistance = (int32)distance;

	//TArray<Waypoint> segment;

	FVector start = this->CalculatePoint(0, p0, p1, p2, p3);
	//segment.Add(Waypoint(start, 0));
	// Draw tangents

	DrawDebugLine(this->GetWorld(), p0, p0 + (p1 - p0) / 2, FColor::Red, false, 1, 0, 8);
	DrawDebugLine(this->GetWorld(), p3, p3 + (p2 - p3) / 2, FColor::Green, false, 1, 0, 8);

	// Draw spline segment
	for (int i = 1; i < roundedDistance; ++i)
	{
		FVector end = CalculatePoint((float)i / distance, p0, p1, p2, p3);
		//if(i % 10 == 0 || i == roundedDistance - 1) segment.Add(Waypoint(end, 0));
		DrawDebugLine(this->GetWorld(), start, end, FColor::Yellow, true, 1, 0, 10);
		start = end;
	}
	//this->waypoints.Add(segment);
}

/* Calculate the total length of the spline */
float ATrackSplineComponent::ConstructWaypoints()
{
	if (this->splineNodes.Num() < 2) return 0;
	this->waypoints.Empty();
	float length = 0;
	ATrackSplineNode* start = *(this->splineNodes.GetTypedData());
	for (TArray<class ATrackSplineNode*>::TIterator iter = this->splineNodes.CreateIterator(); iter; iter++)
	{
		if (!(*iter)) continue;
		if (start == *iter)
		{
			// Calculate the length between first and last node if ConnectEndPoints is true, else skip to next iteration
			if (!this->ConnectEndPoints) continue;
			ATrackSplineNode* end = this->splineNodes.Last();
			length += CalculateSplineSegmentLength(start, end, length);
		}
		else
		{
			ATrackSplineNode* end = *iter;
			length += CalculateSplineSegmentLength(start, end, length);
			start = end;
		}
	}
	return length;
}

/* Calculate the length of a segment of the spline between two given nodes */
float ATrackSplineComponent::CalculateSplineSegmentLength(ATrackSplineNode* first, ATrackSplineNode* second, float distanceFromStart)
{
	float length = 0;
	float distance = FVector::Dist(first->GetActorLocation(), second->GetActorLocation());
	int32 roundedDistance = (int32)distance;
	TArray<Waypoint> segment;

	FVector start = CalculatePoint(0, first->GetActorLocation(), first->front, second->back, second->GetActorLocation());
	segment.Add(Waypoint(start, distanceFromStart));
	FVector end;
	for (int i = 1; i < roundedDistance; ++i)
	{
		end = CalculatePoint((float)i / distance, first->GetActorLocation(), first->front, second->back, second->GetActorLocation());
		length += FVector::Dist(start, end);
		if (i % 50 == 0 || i == roundedDistance - 1) segment.Add(Waypoint(end, distanceFromStart + length));
		start = end;
	}
	this->waypoints.Add(segment);
	return length;
}

float ATrackSplineComponent::RelativeSplinePosition(FVector referencePoint)
{
	float distanceFromReferencePoint = FLT_MAX;
	float distanceFromStart = 0;
	for (int i = 0; i < this->waypoints.Num(); i++)
	{
		for (int j = 0; j < this->waypoints[i].Num(); j++)
		{
			float tempDistance = FVector::Dist(referencePoint, (waypoints[i])[j].location);
			if (tempDistance < distanceFromReferencePoint)
			{
				distanceFromReferencePoint = tempDistance;
				distanceFromStart = (waypoints[i])[j].distanceFromStart;
			}
		}
	}
	return distanceFromStart / (waypoints.Last()).Last().distanceFromStart;
}

/* Called on game start */
void ATrackSplineComponent::BeginPlay()
{
	Super::BeginPlay();
	this->SplineLength = ConstructWaypoints();

}

void ATrackSplineComponent::Tick(float DeltaSeconds)
{
	if (this->ShowSplinesInGame) DrawCurve();
	Super::Tick(DeltaSeconds);
}

void ATrackSplineComponent::PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent)
{
	Super::PostEditChangeProperty(PropertyChangedEvent);
	ConstructWaypoints();
}

//void ATrackSplineComponent::DisplayDebug(UCanvas* Canvas, const class FDebugDisplayInfo& DebugDisplay, float& YL, float& YPos)
//{
//	Super::DisplayDebug(Canvas, DebugDisplay., YL, YPos);
//	GEngine->AddOnScreenDebugMessage(-1, 10, FColor::Yellow, TEXT("Test"));
//}