

#pragma once

#include "Components/SceneComponent.h"
#include "WheelConstraint.generated.h"

/**
 * 
 */
UCLASS(ClassGroup = Physics, dependson(ConstraintInstance), MinimalAPI, meta = (BlueprintSpawnableComponent), HideCategories = (Activation, "Components|Activation", Physics, Mobility), ShowCategories = ("Physics|Components|WheelConstraint"))
class UWheelConstraint : public USceneComponent
{
	GENERATED_UCLASS_BODY()

	UPROPERTY(VisibleAnywhere, Category = Constraint)
	UPhysicsConstraintComponent* parentConstraint;

	UFUNCTION(BlueprintCallable, Category = WheelConstraint)
	void UpdateWheel();

protected:
	FBodyInstance* GetBodyInstance(EConstraintFrame::Type Frame) const;
	UPrimitiveComponent* GetComponentInternal(EConstraintFrame::Type Frame) const;
};
