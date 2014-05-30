

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


UPrimitiveComponent* AVehicleWheelMeshBase::GetRigidBody()
{
	return (UPrimitiveComponent*)(this->WheelMesh.Get());
}

