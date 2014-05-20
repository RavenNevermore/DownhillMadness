

#include "DownhillMadness.h"
#include "WheelConstraint.h"


UWheelConstraint::UWheelConstraint(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->bWantsInitializeComponent = true;
	this->parentConstraint = (UPhysicsConstraintComponent*)(this->GetAttachParent());
}


void UWheelConstraint::UpdateWheel()
{
	if (this->parentConstraint == nullptr)
		return;

	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor(1.0f, 0.0f, 0.0f, 1.0f), TEXT("Blah"));
	}

	FBodyInstance* Body1 = GetBodyInstance(EConstraintFrame::Frame1);
	FBodyInstance* Body2 = GetBodyInstance(EConstraintFrame::Frame2);
	this->parentConstraint->ConstraintInstance.InitConstraint(this, Body1, Body2, 1.0f);
}


FBodyInstance* UWheelConstraint::GetBodyInstance(EConstraintFrame::Type Frame) const
{
	if (this->parentConstraint == nullptr)
		return nullptr;

	FBodyInstance* Instance = NULL;
	UPrimitiveComponent* PrimComp = GetComponentInternal(Frame);
	if (PrimComp != NULL)
	{
		if (Frame == EConstraintFrame::Frame1)
		{
			Instance = PrimComp->GetBodyInstance(this->parentConstraint->ConstraintInstance.ConstraintBone1);
		}
		else
		{
			Instance = PrimComp->GetBodyInstance(this->parentConstraint->ConstraintInstance.ConstraintBone2);
		}
	}
	return Instance;
}



UPrimitiveComponent* UWheelConstraint::GetComponentInternal(EConstraintFrame::Type Frame) const
{
	if (this->parentConstraint == nullptr)
		return nullptr;

	UPrimitiveComponent* PrimComp = NULL;

	FName ComponentName = NAME_None;
	AActor* Actor = NULL;

	// Frame 1
	if (Frame == EConstraintFrame::Frame1)
	{
		// Use override component if specified
		if (this->parentConstraint->OverrideComponent1.IsValid())
		{
			return this->parentConstraint->OverrideComponent1.Get();
		}

		ComponentName = this->parentConstraint->ComponentName1.ComponentName;
		Actor = this->parentConstraint->ConstraintActor1;
	}
	// Frame 2
	else
	{
		// Use override component if specified
		if (this->parentConstraint->OverrideComponent2.IsValid())
		{
			return this->parentConstraint->OverrideComponent2.Get();
		}

		ComponentName = this->parentConstraint->ComponentName2.ComponentName;
		Actor = this->parentConstraint->ConstraintActor2;
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