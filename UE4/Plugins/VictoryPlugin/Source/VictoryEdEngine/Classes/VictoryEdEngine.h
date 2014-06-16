#pragma once

#include "UnrealEd.h" 
#include "VictoryEdAlignMode.h"
#include "VictoryEdEngine.generated.h"

USTRUCT()
struct FDropToClosestSurfaceData
{
	GENERATED_USTRUCT_BODY()
	
	UPROPERTY()
	AStaticMeshActor* TheActor;
	
	UPROPERTY()
	FVector SurfaceLoc;
	
	UPROPERTY()
	float DistSquared;
	
	FDropToClosestSurfaceData()
	{
		DistSquared = 1000000000;
		SurfaceLoc = FVector::ZeroVector;
		TheActor = NULL;
	}
};
USTRUCT()
struct FVButton
{
	GENERATED_USTRUCT_BODY()
	
	UPROPERTY()
	int32 Vibe;
	
	UPROPERTY()
	FVector PointInWorld;
	
	UPROPERTY()
	float minX;
	
	UPROPERTY()
	float maxX;
	
	UPROPERTY()
	float minY;
	
	UPROPERTY()
	float maxY;
	
	FVButton()
	{
		Vibe = -1;
	}
};

UCLASS(config=Engine)
class UVictoryEdEngine : public UUnrealEdEngine
{
	GENERATED_UCLASS_BODY()
		
	bool CreatedVictoryEdMode;

	//the user-selected mode prior to initiating VictoryEdMode
	FEditorModeID PrevModeID;

	
//utility

//Assets
public:
	
	/*
	UPROPERTY()
	UStaticMesh* AssetSM_EngineCube;
	//StaticMesh'/Engine/EngineMeshes/Cube.Cube'
	
	
	UPROPERTY()
	UMaterial* ColorMat;
	
	UPROPERTY()
	UMaterialInstanceDynamic* ColorMatInst_GlowyBlue;
	
	UPROPERTY()
	UMaterialInstanceDynamic* ColorMatInst_GlowyRed;
	
	UPROPERTY()
	UMaterialInstanceDynamic* ColorMatInst_GlowyYellow;
	*/
	
//Font
public:
	UPROPERTY()
	UFont* VictoryEditorFont;
	//Font'/Engine/EngineFonts/RobotoDistanceField.RobotoDistanceField'
	
	FORCEINLINE UFont* GetVictoryFont()
	{
		if(VictoryEditorFont) return VictoryEditorFont;
		return GetStatsFont();
	}
	
//Selection
public:
	AActor* VSelectedActor;
	
	TArray<FVector> SelectionRelativeOffsets;
	void GetSelectedActorsRelativeOffsets();
	bool SelectedActorVerticiesNeedsUpdating;
	bool ClearSelectedVertex;
	
//core
public:
	static const FName VictoryEditorModeID;
	void SwitchToVictoryEdMode();
	
	FORCEINLINE void ExitVictoryAlignMode()
	{
		//Deactivate Mode
		GEditorModeTools().DeactivateMode( VictoryEditorModeID );
		
		//Restore Previous Realtime State
		//GCurrentLevelEditingViewportClient->RestoreRealtime(true); //allow disable
		
		//Activate Previous Mode
		GEditorModeTools().ActivateMode(PrevModeID);
	}
	
//tests
public:
	void RunTests();
	
protected:
	
	virtual void NoteSelectionChange() OVERRIDE;
	
	virtual void Tick(float DeltaSeconds, bool bIdleMode) OVERRIDE;
};