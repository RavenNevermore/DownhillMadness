

#include "DownhillMadness.h"
#include "VehicleWheelCapsuleBase.h"


AVehicleWheelCapsuleBase::AVehicleWheelCapsuleBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->WheelCapsule = PCIP.CreateDefaultSubobject<UCapsuleComponent>(this, FName(TEXT("WheelCapsule")));
	this->WheelCapsule->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->WheelCapsule->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->WheelCapsule->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->WheelCapsule->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->WheelCapsule->SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Block);
	this->WheelCapsule->SetPhysicsMaxAngularVelocity(5000.0f);
	this->WheelCapsule->SetNotifyRigidBodyCollision(true);
	this->WheelCapsule->bGenerateOverlapEvents = true;
	this->WheelCapsule->SetCapsuleHalfHeight(40.0f);
	this->WheelCapsule->SetCapsuleRadius(22.0f);
	this->WheelCapsule->RelativeRotation.Roll = 90.0f;
	this->WheelCapsule->AttachTo(this->RootComponent);

	this->WheelMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("WheelMesh")));
	this->WheelMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->WheelMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->WheelMesh->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->WheelMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->WheelMesh->SetSimulatePhysics(false);
	this->WheelMesh->RelativeRotation.Roll = -90.0f;
	this->WheelMesh->AttachTo(this->WheelCapsule);
}


// ----------------------------------------------------------------------------


UPrimitiveComponent* AVehicleWheelCapsuleBase::GetRigidBody()
{
	return (UPrimitiveComponent*)(this->WheelCapsule.Get());
}


