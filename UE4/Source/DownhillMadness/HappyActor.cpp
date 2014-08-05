

#include "DownhillMadness.h"
#include "HappyActor.h"


AHappyActor::AHappyActor(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->DriverSkeletalMesh = PCIP.CreateDefaultSubobject<USkeletalMeshComponent>(this, FName(TEXT("DriverSkeletalMesh")));
	this->DriverSkeletalMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->DriverSkeletalMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->DriverSkeletalMesh->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->DriverSkeletalMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->DriverSkeletalMesh->bAbsoluteScale = true;
	this->DriverSkeletalMesh->SetSimulatePhysics(false);
	this->DriverSkeletalMesh->SetEnableGravity(false);
	this->DriverSkeletalMesh->AttachTo(this->FrontArrow);

	this->PlayerMaterialBillboard = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("PlayerMaterialBillboard")));
	this->PlayerMaterialBillboard->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->PlayerMaterialBillboard->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->PlayerMaterialBillboard->SetCollisionEnabled(ECollisionEnabled::NoCollision);
	this->PlayerMaterialBillboard->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
	this->PlayerMaterialBillboard->bAbsoluteScale = true;
	this->PlayerMaterialBillboard->bAbsoluteRotation = true;
	this->PlayerMaterialBillboard->SetSimulatePhysics(false);
	this->PlayerMaterialBillboard->SetEnableGravity(false);
	this->PlayerMaterialBillboard->AttachTo(this->FrontArrow);
}


