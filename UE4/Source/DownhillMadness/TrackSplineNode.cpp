

#include "DownhillMadness.h"
#include "TrackSplineComponent.h"
#include "TrackSplineNode.h"

/* Default UE4 constructor */
ATrackSplineNode::ATrackSplineNode(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	// Initialize tangent endpoints to be at the actor location
	

	//Initialize the length of the tangents to 0
	this->backStretchValue = 0;
	this->frontStrechValue = 0;

	// Enable ticking for the actor
	PrimaryActorTick.bCanEverTick = true;
	this->SetActorHiddenInGame(true);

	this->pin = PCIP.CreateDefaultSubobject<class USphereComponent>(this, TEXT("Pin"));
	//this->pin->SetRelativeScale3D(FVector(1, 1, 10));
	this->pin->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->pin->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->pin->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->pin->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->pin->SetSimulatePhysics(false);
	this->pin->SetEnableGravity(false);
	this->RootComponent = this->pin;
}

void ATrackSplineNode::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);
	// Update tangent endpoints according to their rotation and stretch value
	this->front = this->GetActorLocation() + this->frontRotation.Vector() * this->frontStrechValue;
	this->back = this->GetActorLocation() + this->backRotation.Vector() * -(this->backStretchValue);
}

void ATrackSplineNode::OnConstruction(const FTransform& Transform)
{
	this->back = this->GetActorLocation();
	this->front = this->GetActorLocation();
	Super::OnConstruction(Transform);
}

//void ATrackSplineNode::EditorApplyTranslation(const FVector& DeltaTranslation, bool bAltDown, bool bShiftDown, bool bCtrlDown)
//{
//	Super::EditorApplyTranslation(DeltaTranslation, bAltDown, bShiftDown, bCtrlDown);
//	//ATrackSplineComponent* parent = ((ATrackSplineComponent*)(this->getactor()));
//	//if (parent) parent->ConstructWaypoints();
//}




