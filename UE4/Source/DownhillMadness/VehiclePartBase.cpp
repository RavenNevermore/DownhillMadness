

#include "DownhillMadness.h"
#include "VehiclePartBase.h"



#include "Kismet/GameplayStatics.h"
#include "SavedGameData.h"


AVehiclePartBase::AVehiclePartBase(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
}


// ----------------------------------------------------------------------------


void AVehiclePartBase::HidePart()
{
}


// ----------------------------------------------------------------------------


void AVehiclePartBase::ShowPart()
{
}


// ----------------------------------------------------------------------------


void AVehiclePartBase::SelectPart()
{
}


// ----------------------------------------------------------------------------


void AVehiclePartBase::DeselectPart()
{
}


// ----------------------------------------------------------------------------


void AVehiclePartBase::SetPartLocationAndRotation(FVector location, FRotator rotation)
{
}


// ----------------------------------------------------------------------------


FString AVehiclePartBase::GetGeneratedName()
{
	FString partName(TEXT(""));

	if (this->GetClass()->ClassGeneratedBy != nullptr)
		partName += this->GetClass()->ClassGeneratedBy->GetFName().ToString();
	else
		partName += this->GetClass()->GetFName().ToString();

	partName = partName.Replace(TEXT("Mesh"), TEXT(""), ESearchCase::CaseSensitive);
	partName = partName.Replace(TEXT("Capsule"), TEXT(""), ESearchCase::CaseSensitive);

	partName = FName::NameToDisplayString(partName, false);

	partName = partName.Replace(TEXT("Weight"), TEXT("(Weight)"), ESearchCase::CaseSensitive);

	return partName;
}


// ----------------------------------------------------------------------------


UClass* AVehiclePartBase::GetPartClass(bool bGetSymmetricPart)
{
	if (!bGetSymmetricPart || this->symmetricPart == nullptr)
		return this->GetClass();
	else
		return this->symmetricPart;
}

