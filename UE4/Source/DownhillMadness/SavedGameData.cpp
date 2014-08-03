

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
	this->bifrostUnlocked = false;

	this->bIsFullscreen = false;
	this->windowWidth = 1280;
	this->windowHeight = 720;

	this->antiAliasingQuality = 2;
	this->graphicsQuality = 2;
	this->musicVolume = 1.0f;
	this->soundVolume = 1.0f;
	this->voicesVolume = 1.0f;
}


