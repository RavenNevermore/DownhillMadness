

#include "DownhillMadness.h"
#include "GoalPodest.h"


AGoalPodest::AGoalPodest(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	this->FrontArrow = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("FrontArrow")));
	this->FrontArrow->bAbsoluteScale = true;
	this->RootComponent = this->FrontArrow;

	this->SocketFirst = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("SocketFirst")));
	this->SocketFirst->AttachTo(this->FrontArrow);

	this->SocketSecond = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("SocketSecond")));
	this->SocketSecond->AttachTo(this->FrontArrow);

	this->SocketThird = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("SocketThird")));
	this->SocketThird->AttachTo(this->FrontArrow);

	this->SocketFourth = PCIP.CreateDefaultSubobject<UArrowComponent>(this, FName(TEXT("SocketFourth")));
	this->SocketFourth->AttachTo(this->FrontArrow);
}


