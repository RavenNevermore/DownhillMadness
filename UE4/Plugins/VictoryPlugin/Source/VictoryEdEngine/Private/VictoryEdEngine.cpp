// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.

//Unreal Editor Fun With Rama

//#include "VictoryGame.h"
#include "VictoryEdEnginePCH.h"

#include "ScopedTransaction.h"

#define LOCTEXT_NAMESPACE "VictoryEdEngine"

const FName UVictoryEdEngine::VictoryEditorModeID = FName("VictoryEditorMode");

UVictoryEdEngine::UVictoryEdEngine(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	CreatedVictoryEdMode = false;
	
	PrevModeID = FBuiltinEditorModes::EM_Default;
	
	//Font
	static ConstructorHelpers::FObjectFinder<UFont> TheFontOb(TEXT("Font'/Engine/EngineFonts/RobotoDistanceField.RobotoDistanceField'"));
	VictoryEditorFont = (UFont*)TheFontOb.Object;
	
	/*
	//Cube
	static ConstructorHelpers::FObjectFinder<UStaticMesh> StaticMeshOb_cube(TEXT("StaticMesh'/Engine/EngineMeshes/Cube.Cube'"));
	AssetSM_EngineCube= StaticMeshOb_cube.Object;
	
	//Color Mat Inst
	static ConstructorHelpers::FObjectFinder<UMaterial> ColorMatInstOb(TEXT("Material'/Engine/EditorMaterials/Utilities/LinearColorPicker_MAT.LinearColorPicker_MAT'"));
	ColorMat = ColorMatInstOb.Object;
	
	//Create Instance
	if(ColorMat)
	{
		ColorMatInst_GlowyBlue = UMaterialInstanceDynamic::Create(ColorMat, this);
		if(ColorMatInst_GlowyBlue) ColorMatInst_GlowyBlue->SetVectorParameterValue(FName("Color"), FLinearColor(0,0,1,1));
		
		ColorMatInst_GlowyRed = UMaterialInstanceDynamic::Create(ColorMat, this);
		if(ColorMatInst_GlowyRed) ColorMatInst_GlowyRed->SetVectorParameterValue(FName("Color"), FLinearColor(1,0,0,1));
		
		ColorMatInst_GlowyYellow = UMaterialInstanceDynamic::Create(ColorMat, this);
		if(ColorMatInst_GlowyYellow) ColorMatInst_GlowyYellow->SetVectorParameterValue(FName("Color"), FLinearColor(1,1,0,1));
	}
	*/
}

void UVictoryEdEngine::SwitchToVictoryEdMode()
{
	//Create it if it not exist yet
	if(!CreatedVictoryEdMode)
	{
		//Proper way to make a shared ref ???
		TSharedRef<class FVictoryEdAlignMode,ESPMode::Fast> VictoryEdMode = MakeShareable( new FVictoryEdAlignMode() );
		
		//Init VictoryEdMode
		VictoryEdMode->JoyInit(this);
			
		//Register
		GEditorModeTools().RegisterMode(VictoryEdMode);
	
		CreatedVictoryEdMode = true;
	}
	
	//~~~ Store Previous Editor Mode ~~~
	TArray<FEdMode*> OutActiveModes;
	FEdMode* CurMode = NULL;
	GEditorModeTools().GetActiveModes( OutActiveModes );
	
	for(int32 Itr = 0; Itr < OutActiveModes.Num(); Itr++)
	{
		CurMode = OutActiveModes[Itr];
		if(!CurMode) continue;
		if(CurMode->GetID() == VictoryEditorModeID ) continue;
			
		PrevModeID = CurMode->GetID();
		//UE_LOG(Victory,Warning, TEXT("Previous Editor Mode: %s"), *CurMode->GetID().ToString() );
	}
		
	//Activate Victory Editor Mode
	GEditorModeTools().ActivateMode(VictoryEditorModeID);
}

void UVictoryEdEngine::RunTests()
{
	//tests
}


void UVictoryEdEngine::GetSelectedActorsRelativeOffsets()
{
	SelectionRelativeOffsets.Empty();
	//~~~~~~~~~~~~~~~~~~~~~~~~
	
	//Get the Relative Offsets
	const FVector Origin = VSelectedActor->GetActorLocation();
	
	AActor* VSelectItrActor;
	for(FSelectionIterator VSelectItr = GetSelectedActorIterator(); 
		VSelectItr; ++VSelectItr )
	{
		VSelectItrActor = Cast<AActor>(*VSelectItr);
		if(!VSelectItrActor) continue;
		//~~~~~~~~~~~~~~~~~~
		
		SelectionRelativeOffsets.Add(VSelectItrActor->GetActorLocation() - Origin );
		//UE_LOG(Victory, Error, TEXT("Relative offset %s"), *SelectionRelativeOffsets[SelectionRelativeOffsets.Num() - 1].ToString());
	};
}
void UVictoryEdEngine::NoteSelectionChange()
{
	Super::NoteSelectionChange();
	//~~~~~~~~~~~~~~~~~
	
	if(!GetSelectedActors()) return;
	AActor* SelectedActor = Cast<AActor>(GetSelectedActors()->GetTop(AActor::StaticClass()));
	if(!SelectedActor) return;
	//~~~~~~~~~~~~~~~
	
	//Not the Same?
	if(SelectedActor != VSelectedActor)
	{
		//UNDO SAVE After MOVE
		const FScopedTransaction Transaction( TEXT("Snap"), LOCTEXT( "VictoryGame", "Victory Vertex Snap" ), SelectedActor->GetRootComponent()  );
		SelectedActor->GetRootComponent()->Modify();
	
		ClearSelectedVertex = true;
	}
	
	//Update
	VSelectedActor = SelectedActor;
	
	//For Editor Undo / Redo
	//		does this flag ever need to be unset?!?!?!?
	VSelectedActor->SetFlags(RF_Transactional);
	
	
	
	//Always Refresh
	SelectedActorVerticiesNeedsUpdating = true;
	
	//For use with multi-select moves
	GetSelectedActorsRelativeOffsets();
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	//Only Activate for Static Mesh Actors Currently
	if(SelectedActor->IsA(AStaticMeshActor::StaticClass()))
	{
		//Switch to Victory Align Mode if not active already
		if(!GEditorModeTools().IsModeActive(VictoryEditorModeID)) 
			SwitchToVictoryEdMode();
	}
	else
	{
		//Deactivate Mode for Non-Static Mesh Actors
		ExitVictoryAlignMode();
	}
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	//RunTests();
	
	//UE_LOG(Victory, Warning, TEXT("New Selected Actor %s"), *SelectedActor->GetName() );
	//UE_LOG(Victory, Warning, TEXT("New Selected Actor Location %s"), *SelectedActor->GetActorLocation().ToString() );
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void UVictoryEdEngine::Tick(float DeltaSeconds, bool bIdleMode)
{
	Super::Tick(DeltaSeconds,bIdleMode);
	

}