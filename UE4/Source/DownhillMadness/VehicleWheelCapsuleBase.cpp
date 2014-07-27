

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
	this->WheelCapsule->BodyInstance.bUpdateMassWhenScaleChanges = true;
	this->WheelCapsule->AttachTo(this->RootComponent);

	this->WheelMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("WheelMesh")));
	this->WheelMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->WheelMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->WheelMesh->SetCollisionEnabled(ECollisionEnabled::QueryOnly);
	this->WheelMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->WheelMesh->SetSimulatePhysics(false);
	this->WheelMesh->RelativeRotation.Roll = -90.0f;
	this->WheelMesh->AttachTo(this->WheelCapsule);
}


// ----------------------------------------------------------------------------


void AVehicleWheelCapsuleBase::HidePart()
{
	this->WheelMesh->SetHiddenInGame(true, false);
	this->WheelMesh->SetVisibility(false, false);
	this->AxisMesh->SetHiddenInGame(true, false);
	this->AxisMesh->SetVisibility(false, false);
	this->BrakeMesh->SetHiddenInGame(true, false);
	this->BrakeMesh->SetVisibility(false, false);
}


// ----------------------------------------------------------------------------


void AVehicleWheelCapsuleBase::ShowPart()
{
	this->WheelMesh->SetHiddenInGame(false, false);
	this->WheelMesh->SetVisibility(true, false);
	this->AxisMesh->SetHiddenInGame(false, false);
	this->AxisMesh->SetVisibility(true, false);
	this->BrakeMesh->SetHiddenInGame(false, false);
	this->BrakeMesh->SetVisibility(true, false);
}


// ----------------------------------------------------------------------------


void AVehicleWheelCapsuleBase::SelectPart()
{
	this->WheelMesh->SetRenderCustomDepth(true);
	this->AxisMesh->SetRenderCustomDepth(true);
	this->BrakeMesh->SetRenderCustomDepth(true);
}


// ----------------------------------------------------------------------------


void AVehicleWheelCapsuleBase::DeselectPart()
{
	this->WheelMesh->SetRenderCustomDepth(false);
	this->AxisMesh->SetRenderCustomDepth(false);
	this->BrakeMesh->SetRenderCustomDepth(false);
}


// ----------------------------------------------------------------------------


void AVehicleWheelCapsuleBase::BeginPlay()
{
	Super::BeginPlay();
	UPhysicalMaterial* PhysMaterial = this->WheelMesh->GetBodySetup()->PhysMaterial;
	if (PhysMaterial == NULL && GEngine != NULL)
	{
		PhysMaterial = GEngine->DefaultPhysMaterial;
	}

	this->WheelCapsule->SetPhysMaterialOverride(PhysMaterial);
	this->WheelCapsule->BodyInstance.UpdateMassProperties();
	float massDifference = this->WheelMesh->CalculateMass() / (this->WheelCapsule->CalculateMass() / this->WheelCapsule->BodyInstance.MassScale);
	this->WheelCapsule->BodyInstance.MassScale = massDifference;
	this->WheelCapsule->BodyInstance.UpdateMassProperties();
}


// ----------------------------------------------------------------------------


UPrimitiveComponent* AVehicleWheelCapsuleBase::GetRigidBody()
{
	return (UPrimitiveComponent*)(this->WheelCapsule.Get());
}


