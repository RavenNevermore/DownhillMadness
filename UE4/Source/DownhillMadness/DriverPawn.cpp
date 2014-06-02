

#include "DownhillMadness.h"
#include "DriverPawn.h"


ADriverPawn::ADriverPawn(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->PhysicsConstraint = PCIP.CreateDefaultSubobject<UPhysicsConstraintComponent>(this, FName(TEXT("PhysicsConstraint")));
	this->PhysicsConstraint->ConstraintInstance.LinearXMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.LinearYMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.LinearZMotion = ELinearConstraintMotion::LCM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularSwing1Motion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularSwing2Motion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->ConstraintInstance.AngularTwistMotion = EAngularConstraintMotion::ACM_Locked;
	this->PhysicsConstraint->bAbsoluteScale = true;
	this->PhysicsConstraint->AttachTo(this->FrontArrow);

	this->DriverMesh = PCIP.CreateDefaultSubobject<UStaticMeshComponent>(this, FName(TEXT("DriverMesh")));
	this->DriverMesh->SetCollisionProfileName(FName(TEXT("WorldDynamic")));
	this->DriverMesh->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
	this->DriverMesh->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
	this->DriverMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
	this->DriverMesh->SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Block);
	this->DriverMesh->SetSimulatePhysics(true);
	this->DriverMesh->bAbsoluteScale = true;
	this->DriverMesh->AttachTo(this->RootComponent);

	this->driverState = EDriverPawnState::PushingVehicle;
	this->steeringAxisInput = 0.0f;

	this->PrimaryActorTick.bCanEverTick = true;
	this->SetActorTickEnabled(true);
}


// ----------------------------------------------------------------------------


void ADriverPawn::BeginPlay()
{
	Super::BeginPlay();
}


// ----------------------------------------------------------------------------


void ADriverPawn::Tick(float DeltaSeconds)
{
	Super::Tick(DeltaSeconds);

	if (this->controlledVehicle != nullptr)
	{
		if (this->driverState == EDriverPawnState::JumpingIntoVehicle)
		{
			FTransform newTransform = this->controlledVehicle->Body->ComponentToWorld;
			newTransform.SetScale3D(this->DriverMesh->ComponentToWorld.GetScale3D());
			newTransform.SetLocation(newTransform.GetLocation() - newTransform.GetUnitAxis(EAxis::Z) * 50.0f);
			this->DriverMesh->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Overlap);
			this->DriverMesh->SetWorldTransform(newTransform);
			this->PhysicsConstraint->SetWorldTransform(this->controlledVehicle->Body->ComponentToWorld);
			this->PhysicsConstraint->AttachTo(this->controlledVehicle->Body, NAME_None, EAttachLocation::KeepWorldPosition);

			this->PhysicsConstraint->SetConstrainedComponents(this->DriverMesh, NAME_None, this->controlledVehicle->Body, NAME_None);
			this->PhysicsConstraint->bWantsInitializeComponent = true;
			this->PhysicsConstraint->InitializeComponent();

			this->DriverMesh->SetEnableGravity(true);

			this->driverState = EDriverPawnState::SteeringVehicle;
		}

		if (this->driverState == EDriverPawnState::SteeringVehicle)
		{
			this->controlledVehicle->SetSteeringInput(this->steeringAxisInput);
			this->controlledVehicle->UpdateControls(DeltaSeconds);
		}
	}
}


// ----------------------------------------------------------------------------


void ADriverPawn::SetupPlayerInputComponent(class UInputComponent* InputComponent)
{
	check(InputComponent);
	InputComponent->BindAxis("X Axis", this, &ADriverPawn::OnGetAxisInput);
}


// ----------------------------------------------------------------------------


void ADriverPawn::OnGetAxisInput(float axisInput)
{
	this->steeringAxisInput = axisInput;
}


// ----------------------------------------------------------------------------


void ADriverPawn::SetVehicle(AVehicleBodyBase* vehicle)
{
	if (this->controlledVehicle == nullptr)
		this->controlledVehicle = vehicle;
}


// ----------------------------------------------------------------------------


void ADriverPawn::StartRace()
{
	this->driverState = EDriverPawnState::JumpingIntoVehicle;
}