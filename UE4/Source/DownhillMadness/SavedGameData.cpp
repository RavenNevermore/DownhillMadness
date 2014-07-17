

#include "DownhillMadness.h"
#include "SavedGameData.h"


USavedGameData::USavedGameData(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->trackRecords = TArray<float>();
	this->trackRecords.Empty();

	this->beatenRecords = TArray<bool>();
	this->beatenRecords.Empty();

	this->ratatoskUnlocked = false;
}


