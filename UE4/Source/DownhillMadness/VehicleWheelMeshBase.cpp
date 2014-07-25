

#include "DownhillMadness.h"
#include "VehicleWheelMeshBase.h"


AVehicleWheelMeshBase::AVehicleWheelMeshBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->WheelMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("WheelMesh")));
	this->WheelMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->WheelMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->WheelMesh->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->WheelMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->WheelMesh->SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Block);
	this->WheelMesh->SetPhysicsMaxAngularVelocity(5000.0f);
	this->WheelMesh->SetNotifyRigidBodyCollision(true);
	this->WheelMesh->bGenerateOverlapEvents = true;
	this->WheelMesh->AttachTo(this->RootComponent);
}


// ----------------------------------------------------------------------------


void AVehicleWheelMeshBase::HidePart()
{
	this->WheelMesh->SetHiddenInGame(true, false);
	this->WheelMesh->SetVisibility(false, false);
	this->AxisMesh->SetHiddenInGame(true, false);
	this->AxisMesh->SetVisibility(false, false);
	this->BrakeMesh->SetHiddenInGame(true, false);
	this->BrakeMesh->SetVisibility(false, false);
}


// ----------------------------------------------------------------------------


void AVehicleWheelMeshBase::ShowPart()
{
	this->WheelMesh->SetHiddenInGame(false, false);
	this->WheelMesh->SetVisibility(true, false);
	this->AxisMesh->SetHiddenInGame(false, false);
	this->AxisMesh->SetVisibility(true, false);
	this->BrakeMesh->SetHiddenInGame(false, false);
	this->BrakeMesh->SetVisibility(true, false);
}


// ----------------------------------------------------------------------------


UPrimitiveComponent* AVehicleWheelMeshBase::GetRigidBody()
{
	return (UPrimitiveComponent*)(this->WheelMesh.Get());
}

