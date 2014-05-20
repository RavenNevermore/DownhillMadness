// Copyright 1998-2014 Epic Games, Inc. All Rights Reserved.

#include "DownhillMadness.h"
#include "EnginePrivate.h"
#include "PhysXSupport.h"
#include "MessageLog.h"
#include "UObjectToken.h"

#include "WheelConstraintComponent.h"

#define LOCTEXT_NAMESPACE "WheelConstraintComponent"

UPhysicsConstraintComponent::UPhysicsConstraintComponent(const class FPostConstructInitializeProperties& PCIP)
: Super(PCIP)
{
	bWantsInitializeComponent = true;
}



UPrimitiveComponent* UPhysicsConstraintComponent::GetComponentInternal(EConstraintFrame::Type Frame) const
{
	UPrimitiveComponent* PrimComp = NULL;

	FName ComponentName = NAME_None;
	AActor* Actor = NULL;

	// Frame 1
	if (Frame == EConstraintFrame::Frame1)
	{
		// Use override component if specified
		if (OverrideComponent1.IsValid())
		{
			return OverrideComponent1.Get();
		}

		ComponentName = ComponentName1.ComponentName;
		Actor = ConstraintActor1;
	}
	// Frame 2
	else
	{
		// Use override component if specified
		if (OverrideComponent2.IsValid())
		{
			return OverrideComponent2.Get();
		}

		ComponentName = ComponentName2.ComponentName;
		Actor = ConstraintActor2;
	}

	// If neither actor nor component name specified, joint to 'world'
	if (Actor != NULL || ComponentName != NAME_None)
	{
		// If no actor specified, but component name is - use Owner
		if (Actor == NULL)
		{
			Actor = GetOwner();
		}

		// If we now have an Actor, lets find a component
		if (Actor != NULL)
		{
			// No name specified, use the root component
			if (ComponentName == NAME_None)
			{
				PrimComp = Actor->GetRootPrimitiveComponent();
			}
			// Name specified, see if we can find that property..
			else
			{
				UObjectPropertyBase* ObjProp = FindField<UObjectPropertyBase>(Actor->GetClass(), ComponentName);
				if (ObjProp != NULL)
				{
					// .. and return the component that is there
					PrimComp = Cast<UPrimitiveComponent>(ObjProp->GetObjectPropertyValue_InContainer(Actor));
				}
			}
		}
	}

	return PrimComp;
}

FTransform UPhysicsConstraintComponent::GetBodyTransformInternal(EConstraintFrame::Type Frame, FName InBoneName) const
{
	FTransform ResultTM = FTransform::Identity;

	UPrimitiveComponent* PrimComp = GetComponentInternal(Frame);

	// Skeletal case
	USkeletalMeshComponent* SkelComp = Cast<USkeletalMeshComponent>(PrimComp);
	if (SkelComp != NULL && !SkelComp->bUseSingleBodyPhysics)
	{
		int32 BoneIndex = SkelComp->GetBoneIndex(InBoneName);
		if (BoneIndex != INDEX_NONE)
		{
			ResultTM = SkelComp->GetBoneTransform(BoneIndex);
		}
	}
	// Non skeletal (ie single body) case.
	else if (PrimComp != NULL)
	{
		ResultTM = PrimComp->ComponentToWorld;
	}

	return ResultTM;
}

FBox UPhysicsConstraintComponent::GetBodyBoxInternal(EConstraintFrame::Type Frame, FName InBoneName) const
{
	FBox ResultBox(0);

	UPrimitiveComponent* PrimComp = GetComponentInternal(Frame);

	// Skeletal case
	USkeletalMeshComponent* SkelComp = Cast<USkeletalMeshComponent>(PrimComp);
	if (SkelComp != NULL && !SkelComp->bUseSingleBodyPhysics)
	{
		UPhysicsAsset * const PhysicsAsset = SkelComp->GetPhysicsAsset();
		if (PhysicsAsset)
		{
			int32 BoneIndex = SkelComp->GetBoneIndex(InBoneName);
			int32 BodyIndex = PhysicsAsset->FindBodyIndex(InBoneName);
			if (BoneIndex != INDEX_NONE && BodyIndex != INDEX_NONE)
			{
				const FTransform BoneTransform = SkelComp->GetBoneTransform(BoneIndex);
				ResultBox = PhysicsAsset->BodySetup[BodyIndex]->AggGeom.CalcAABB(BoneTransform);
			}
		}
	}
	else if (PrimComp != NULL)
	{
		ResultBox = PrimComp->Bounds.GetBox();
	}

	return ResultBox;
}

FTransform UPhysicsConstraintComponent::GetBodyTransform(EConstraintFrame::Type Frame) const
{
	if (Frame == EConstraintFrame::Frame1)
	{
		return GetBodyTransformInternal(Frame, WheelConstraintInstance.ConstraintBone1);
	}
	else
	{
		return GetBodyTransformInternal(Frame, WheelConstraintInstance.ConstraintBone2);
	}
}

FBox UPhysicsConstraintComponent::GetBodyBox(EConstraintFrame::Type Frame) const
{
	if (Frame == EConstraintFrame::Frame1)
	{
		return GetBodyBoxInternal(Frame, WheelConstraintInstance.ConstraintBone1);
	}
	else
	{
		return GetBodyBoxInternal(Frame, WheelConstraintInstance.ConstraintBone2);
	}
}

FBodyInstance* UPhysicsConstraintComponent::GetBodyInstance(EConstraintFrame::Type Frame) const
{
	FBodyInstance* Instance = NULL;
	UPrimitiveComponent* PrimComp = GetComponentInternal(Frame);
	if (PrimComp != NULL)
	{
		if (Frame == EConstraintFrame::Frame1)
		{
			Instance = PrimComp->GetBodyInstance(WheelConstraintInstance.ConstraintBone1);
		}
		else
		{
			Instance = PrimComp->GetBodyInstance(WheelConstraintInstance.ConstraintBone2);
		}
	}
	return Instance;
}


void UPhysicsConstraintComponent::InitComponentConstraint()
{
	// First we convert world space position of constraint into local space frames
	UpdateConstraintFrames();

	// Then we init the constraint
	FBodyInstance* Body1 = GetBodyInstance(EConstraintFrame::Frame1);
	FBodyInstance* Body2 = GetBodyInstance(EConstraintFrame::Frame2);
	WheelConstraintInstance.InitConstraint(this, Body1, Body2, 1.0f);
}

void UPhysicsConstraintComponent::TermComponentConstraint()
{
	WheelConstraintInstance.TermConstraint();
}

void UPhysicsConstraintComponent::OnConstraintBrokenHandler(FWheelConstraintInstance* BrokenConstraint)
{
	OnConstraintBroken.Broadcast(BrokenConstraint->ConstraintIndex);
}

void UPhysicsConstraintComponent::SetConstrainedComponents(UPrimitiveComponent* Component1, FName BoneName1, UPrimitiveComponent* Component2, FName BoneName2)
{
	if (Component1 != NULL)
	{
		OverrideComponent1 = Component1;
		WheelConstraintInstance.ConstraintBone1 = BoneName1;
	}

	if (Component2 != NULL)
	{
		OverrideComponent2 = Component2;
		WheelConstraintInstance.ConstraintBone2 = BoneName2;
	}

	InitComponentConstraint();
}

void UPhysicsConstraintComponent::BreakConstraint()
{
	WheelConstraintInstance.TermConstraint();
}


void UPhysicsConstraintComponent::InitializeComponent()
{
	Super::InitializeComponent();
	InitComponentConstraint();
}

void UPhysicsConstraintComponent::OnRegister()
{
	Super::OnRegister();

#if WITH_EDITOR
	if (SpriteComponent == NULL && GetOwner() && !GetWorld()->IsGameWorld())
	{
		SpriteComponent = ConstructObject<UBillboardComponent>(UBillboardComponent::StaticClass(), GetOwner(), NAME_None, RF_Transactional | RF_TextExportTransient);

		UpdateSpriteTexture();
		SpriteComponent->AttachTo(this);
		SpriteComponent->AlwaysLoadOnClient = false;
		SpriteComponent->AlwaysLoadOnServer = false;
		SpriteComponent->SpriteInfo.Category = TEXT("Physics");
		SpriteComponent->SpriteInfo.DisplayName = NSLOCTEXT("SpriteCategory", "Physics", "Physics");
		SpriteComponent->bCreatedByConstructionScript = bCreatedByConstructionScript;
		SpriteComponent->bIsScreenSizeScaled = true;

		SpriteComponent->RegisterComponent();
	}
#endif
}

void UPhysicsConstraintComponent::OnUnregister()
{
	Super::OnUnregister();

	// Slight hack - there isn't an EndPlayComponent, so we see if we are unregistered and we have an owner but its gone, and if so, we shut down constraint
	if (GetOwner() && GetOwner()->IsPendingKillPending())
	{
		TermComponentConstraint();
	}
}

void UPhysicsConstraintComponent::BeginDestroy()
{
	Super::BeginDestroy();
	TermComponentConstraint();
}

void UPhysicsConstraintComponent::PostLoad()
{
	Super::PostLoad();

	// Fix old content that used a ConstraintSetup
	if (GetLinkerUE4Version() < VER_UE4_ALL_PROPS_TO_CONSTRAINTINSTANCE && (ConstraintSetup_DEPRECATED != NULL))
	{
		// Will have copied from setup into DefaultIntance inside
		WheelConstraintInstance.CopyConstraintParamsFrom(&ConstraintSetup_DEPRECATED->DefaultInstance);
		ConstraintSetup_DEPRECATED = NULL;
	}

	if (GetLinkerUE4Version() < VER_UE4_SOFT_CONSTRAINTS_USE_MASS)
	{
		//In previous versions the mass was placed into the spring constant. This is correct because you use different springs for different mass - however, this makes tuning hard
		//We now multiply mass into the spring constant. To fix old data we use CalculateMass which is not perfect but close (within 0.1kg)
		//We also use the primitive body instance directly for determining if simulated - this is potentially wrong for fixed bones in skeletal mesh, but it's much more likely right (in skeletal case we don't have access to bodies to check)

		UPrimitiveComponent * Primitive1 = GetComponentInternal(EConstraintFrame::Frame1);
		UPrimitiveComponent * Primitive2 = GetComponentInternal(EConstraintFrame::Frame2);

		int NumDynamic = 0;
		float TotalMass = 0.f;

		if (Primitive1 && Primitive1->BodyInstance.bSimulatePhysics)
		{
			FName BoneName = WheelConstraintInstance.ConstraintBone1;
			++NumDynamic;
			TotalMass += Primitive1->CalculateMass(BoneName);
		}

		if (Primitive2 && Primitive2->BodyInstance.bSimulatePhysics)
		{
			FName BoneName = WheelConstraintInstance.ConstraintBone2;
			++NumDynamic;
			TotalMass += Primitive2->CalculateMass(BoneName);
		}

		if ((NumDynamic > 0) && (TotalMass > 0))	//we don't support cases where both constrained bodies are static or NULL, but add this anyway to avoid crash
		{
			float AverageMass = TotalMass / NumDynamic;

			WheelConstraintInstance.LinearLimitStiffness /= AverageMass;
			WheelConstraintInstance.SwingLimitStiffness /= AverageMass;
			WheelConstraintInstance.TwistLimitStiffness /= AverageMass;
			WheelConstraintInstance.LinearLimitDamping /= AverageMass;
			WheelConstraintInstance.SwingLimitDamping /= AverageMass;
			WheelConstraintInstance.TwistLimitDamping /= AverageMass;
		}

	}
}

#if WITH_EDITOR

void UPhysicsConstraintComponent::PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent)
{
	Super::PostEditChangeProperty(PropertyChangedEvent);
	UpdateConstraintFrames();
	UpdateSpriteTexture();
}

void UPhysicsConstraintComponent::PostEditComponentMove(bool bFinished)
{
	Super::PostEditComponentMove(bFinished);

	// Update frames
	UpdateConstraintFrames();
}

void UPhysicsConstraintComponent::CheckForErrors()
{
	Super::CheckForErrors();

	UPrimitiveComponent* PrimComp1 = GetComponentInternal(EConstraintFrame::Frame1);
	UPrimitiveComponent* PrimComp2 = GetComponentInternal(EConstraintFrame::Frame2);

	// Check we have something to joint
	if (PrimComp1 == NULL && PrimComp2 == NULL)
	{
		FFormatNamedArguments Arguments;
		Arguments.Add(TEXT("OwnerName"), FText::FromString(GetNameSafe(GetOwner())));
		FMessageLog("MapCheck").Warning()
			->AddToken(FUObjectToken::Create(this))
			->AddToken(FTextToken::Create(FText::Format(LOCTEXT("NoComponentsFound", "{OwnerName} : No components found to joint."), Arguments)));
	}
	// Make sure constraint components are not both static.
	else if (PrimComp1 != NULL && PrimComp2 != NULL)
	{
		if (PrimComp1->Mobility != EComponentMobility::Movable && PrimComp2->Mobility != EComponentMobility::Movable)
		{
			FFormatNamedArguments Arguments;
			Arguments.Add(TEXT("OwnerName"), FText::FromString(GetNameSafe(GetOwner())));
			FMessageLog("MapCheck").Warning()
				->AddToken(FUObjectToken::Create(this))
				->AddToken(FTextToken::Create(FText::Format(LOCTEXT("BothComponentsStatic", "{OwnerName} : Both components are static."), Arguments)));
		}
	}
	else
	{
		// At this point, we know one constraint component is NULL and the other is non-NULL.
		// Check that the non-NULL constraint component is dynamic.
		if ((PrimComp1 == NULL && PrimComp2->Mobility != EComponentMobility::Movable) ||
			(PrimComp2 == NULL && PrimComp1->Mobility != EComponentMobility::Movable))
		{
			FFormatNamedArguments Arguments;
			Arguments.Add(TEXT("OwnerName"), FText::FromString(GetNameSafe(GetOwner())));
			FMessageLog("MapCheck").Warning()
				->AddToken(FUObjectToken::Create(this))
				->AddToken(FTextToken::Create(FText::Format(LOCTEXT("SingleStaticComponent", "{OwnerName} : Connected to single static component."), Arguments)));
		}
	}
}

#endif // WITH_EDITOR

void UPhysicsConstraintComponent::UpdateConstraintFrames()
{
	FTransform A1Transform = GetBodyTransform(EConstraintFrame::Frame1);
	A1Transform.SetScale3D(FVector(1.f));
	FTransform A2Transform = GetBodyTransform(EConstraintFrame::Frame2);
	A2Transform.SetScale3D(FVector(1.f));

	// World ref frame
	const FVector WPos = GetComponentLocation();
	const FVector WPri = ComponentToWorld.GetUnitAxis(EAxis::X);
	const FVector WOrth = ComponentToWorld.GetUnitAxis(EAxis::Y);

	WheelConstraintInstance.Pos1 = A1Transform.InverseTransformPosition(WPos);
	WheelConstraintInstance.PriAxis1 = A1Transform.InverseTransformVectorNoScale(WPri);
	WheelConstraintInstance.SecAxis1 = A1Transform.InverseTransformVectorNoScale(WOrth);

	WheelConstraintInstance.Pos2 = A2Transform.InverseTransformPosition(WPos);
	WheelConstraintInstance.PriAxis2 = A2Transform.InverseTransformVectorNoScale(WPri);
	WheelConstraintInstance.SecAxis2 = A2Transform.InverseTransformVectorNoScale(WOrth);
}

#if WITH_EDITOR
void UPhysicsConstraintComponent::UpdateSpriteTexture()
{
	if (SpriteComponent)
	{
		if (WheelConstraintInstance.IsHinge())
		{
			SpriteComponent->SetSprite(LoadObject<UTexture2D>(NULL, TEXT("/Engine/EditorResources/S_KHinge.S_KHinge")));
		}
		else if (WheelConstraintInstance.IsPrismatic())
		{
			SpriteComponent->SetSprite(LoadObject<UTexture2D>(NULL, TEXT("/Engine/EditorResources/S_KPrismatic.S_KPrismatic")));
		}
		else
		{
			SpriteComponent->SetSprite(LoadObject<UTexture2D>(NULL, TEXT("/Engine/EditorResources/S_KBSJoint.S_KBSJoint")));
		}
	}
}
#endif // WITH_EDITOR

void UPhysicsConstraintComponent::SetLinearPositionDrive(bool bEnableDriveX, bool bEnableDriveY, bool bEnableDriveZ)
{
	WheelConstraintInstance.SetLinearPositionDrive(bEnableDriveX, bEnableDriveY, bEnableDriveZ);
}

void UPhysicsConstraintComponent::SetLinearVelocityDrive(bool bEnableDriveX, bool bEnableDriveY, bool bEnableDriveZ)
{
	WheelConstraintInstance.SetLinearVelocityDrive(bEnableDriveX, bEnableDriveY, bEnableDriveZ);
}

void UPhysicsConstraintComponent::SetAngularOrientationDrive(bool bEnableSwingDrive, bool bEnableTwistDrive)
{
	WheelConstraintInstance.SetAngularPositionDrive(bEnableSwingDrive, bEnableTwistDrive);
}

void UPhysicsConstraintComponent::SetAngularVelocityDrive(bool bEnableSwingDrive, bool bEnableTwistDrive)
{
	WheelConstraintInstance.SetAngularVelocityDrive(bEnableSwingDrive, bEnableTwistDrive);
}

void UPhysicsConstraintComponent::SetLinearPositionTarget(const FVector& InPosTarget)
{
	WheelConstraintInstance.SetLinearPositionTarget(InPosTarget);
}

void UPhysicsConstraintComponent::SetLinearVelocityTarget(const FVector& InVelTarget)
{
	WheelConstraintInstance.SetLinearVelocityTarget(InVelTarget);
}

void UPhysicsConstraintComponent::SetLinearDriveParams(float InSpring, float InDamping, float InForceLimit)
{
	WheelConstraintInstance.SetLinearDriveParams(InSpring, InDamping, InForceLimit);
}

void UPhysicsConstraintComponent::SetAngularOrientationTarget(const FQuat& InPosTarget)
{
	WheelConstraintInstance.SetAngularOrientationTarget(InPosTarget);
}

void UPhysicsConstraintComponent::SetAngularVelocityTarget(const FVector& InVelTarget)
{
	WheelConstraintInstance.SetAngularVelocityTarget(InVelTarget);
}

void UPhysicsConstraintComponent::SetAngularDriveParams(float InSpring, float InDamping, float InForceLimit)
{
	WheelConstraintInstance.SetAngularDriveParams(InSpring, InDamping, InForceLimit);
}

#undef LOCTEXT_NAMESPACE
