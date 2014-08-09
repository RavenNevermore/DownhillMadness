// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
#include "VictoryBPLibraryPrivatePCH.h"

//////////////////////////////////////////////////////////////////////////
// UVictoryBPFunctionLibrary

UVictoryBPFunctionLibrary::UVictoryBPFunctionLibrary(const class FPostConstructInitializeProperties& PCIP)
	: Super(PCIP)
{
	
}

void UVictoryBPFunctionLibrary::OperatingSystem__GetCurrentPlatform(
	bool& Windows_, 		//some weird bug of making it all caps engine-side
	bool& Mac,
	bool& Linux, 
	bool& iOS,
	bool& Android,
	bool& PS4,
	bool& XBoxOne,
	bool& HTML5,
	bool& WinRT_Arm,
	bool& WinRT
){
	//#define's in UE4 source code
	Windows_ = 				PLATFORM_WINDOWS;
	Mac = 						PLATFORM_MAC;
	Linux = 					PLATFORM_LINUX;
	
	PS4 = 						PLATFORM_PS4;
	XBoxOne = 				PLATFORM_XBOXONE;
	
	iOS = 						PLATFORM_IOS;
	Android = 				PLATFORM_ANDROID;
	
	HTML5 = 					PLATFORM_HTML5;
	
	WinRT_Arm =	 			PLATFORM_WINRT_ARM;
	WinRT 	= 				PLATFORM_WINRT;
}

FString UVictoryBPFunctionLibrary::RealWorldTime__GetCurrentOSTime( 
	int32& MilliSeconds,
	int32& Seconds, 
	int32& Minutes, 
	int32& Hours12,
	int32& Hours24,
	int32& Day,
	int32& Month,
	int32& Year
){
	const FDateTime Now = FDateTime::Now();
	
	MilliSeconds = 		Now.GetMillisecond( );
	Seconds = 			Now.GetSecond( );
	Minutes = 				Now.GetMinute( );
	Hours12 = 			Now.GetHour12( );
	Hours24 = 			Now.GetHour( ); //24
	Day = 					Now.GetDay( );
	Month = 				Now.GetMonth( );
	Year = 				Now.GetYear( );
	
	return Now.ToString();
}

void UVictoryBPFunctionLibrary::RealWorldTime__GetTimePassedSincePreviousTime(
		const FString& PreviousTime,
		float& Milliseconds,
		float& Seconds,
		float& Minutes,
		float& Hours
){
	FDateTime ParsedDateTime;
	FDateTime::Parse(PreviousTime,ParsedDateTime);
	const FTimespan TimeDiff = FDateTime::Now() - ParsedDateTime;
	
	Milliseconds 	= TimeDiff.GetTotalMilliseconds( );
	Seconds 		= TimeDiff.GetTotalSeconds( );
	Minutes 		= TimeDiff.GetTotalMinutes( );
	Hours 			= TimeDiff.GetTotalHours( );
}
	
void UVictoryBPFunctionLibrary::RealWorldTime__GetDifferenceBetweenTimes(
		const FString& PreviousTime1,
		const FString& PreviousTime2,
		float& Milliseconds,
		float& Seconds,
		float& Minutes,
		float& Hours
){
	FDateTime ParsedDateTime1;
	FDateTime::Parse(PreviousTime1,ParsedDateTime1);
	
	FDateTime ParsedDateTime2;
	FDateTime::Parse(PreviousTime2,ParsedDateTime2);
	
	FTimespan TimeDiff; 
	
	if(PreviousTime1 < PreviousTime2)
	{
		TimeDiff = ParsedDateTime2 - ParsedDateTime1;
	}
	else
	{
		TimeDiff = ParsedDateTime1 - ParsedDateTime2;
	}
	
	Milliseconds 	= TimeDiff.GetTotalMilliseconds( );
	Seconds 		= TimeDiff.GetTotalSeconds( );
	Minutes 		= TimeDiff.GetTotalMinutes( );
	Hours 			= TimeDiff.GetTotalHours( );
}

int32 UVictoryBPFunctionLibrary::Conversion__FloatToRoundedInteger(float IN_Float)
{
	return FGenericPlatformMath::Round(IN_Float);
}

FString UVictoryBPFunctionLibrary::String__CombineStrings(FString StringFirst, FString StringSecond, FString Separator, FString StringFirstLabel, FString StringSecondLabel)
{
	return StringFirstLabel + StringFirst + Separator + StringSecondLabel + StringSecond;
}

bool UVictoryBPFunctionLibrary::OptionsMenu__GetDisplayAdapterScreenResolutions(TArray<int32>& Widths, TArray<int32>& Heights, TArray<int32>& RefreshRates,bool IncludeRefreshRates)
{
	//Clear any Previous
	Widths.Empty();
	Heights.Empty();
	RefreshRates.Empty();
	
	TArray<FString> Unique;	
	
	FScreenResolutionArray Resolutions;
	if(RHIGetAvailableResolutions(Resolutions, false))
	{
		for (const FScreenResolutionRHI& EachResolution : Resolutions)
		{
			FString Str = "";
			Str += FString::FromInt(EachResolution.Width);
			Str += FString::FromInt(EachResolution.Height);
			
			//Include Refresh Rates?
			if(IncludeRefreshRates)
			{
				Str += FString::FromInt(EachResolution.RefreshRate);
			}		
			
			if(Unique.Contains(Str))
			{
				//Skip! This is duplicate!
				continue;
			}
			else
			{
				//Add to Unique List!
				Unique.AddUnique(Str);
			}
			
			//Add to Actual Data Output!
			Widths.Add(			EachResolution.Width);
			Heights.Add(			EachResolution.Height);
			RefreshRates.Add(	EachResolution.RefreshRate);
		}

		return true;
	}
	return false;
}

AStaticMeshActor* UVictoryBPFunctionLibrary::Clone__StaticMeshActor(UObject* WorldContextObject, bool&IsValid, AStaticMeshActor* ToClone, FVector LocationOffset,FRotator RotationOffset)
{
	IsValid = false;
	if(!ToClone) return NULL;
	if(!ToClone->IsValidLowLevel()) return NULL;
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	if(!WorldContextObject) return NULL;
	
	//using a context object to get the world!
    UWorld* const World = GEngine->GetWorldFromContextObject(WorldContextObject);
	if(!World) return NULL;
	//~~~~~~~~~~~
	
	//For BPS
	UClass* SpawnClass = ToClone->GetClass();
	
	FActorSpawnParameters SpawnInfo;
	SpawnInfo.bNoCollisionFail 		= true;
	SpawnInfo.Owner 				= ToClone;
	SpawnInfo.Instigator				= NULL;
	SpawnInfo.bDeferConstruction 	= 0;
	
	AStaticMeshActor* NewSMA = World->SpawnActor<AStaticMeshActor>(SpawnClass, ToClone->GetActorLocation() + FVector(0,0,512) ,ToClone->GetActorRotation(), SpawnInfo );
	
	if(!NewSMA) return NULL;
	
	//Copy Transform
	NewSMA->SetActorTransform(ToClone->GetTransform());
	
	//Mobility
	NewSMA->StaticMeshComponent->SetMobility(EComponentMobility::Movable	);
	
	//copy static mesh
	NewSMA->StaticMeshComponent->SetStaticMesh(ToClone->StaticMeshComponent->StaticMesh);
	
	//~~~
	
	//copy materials
	TArray<UMaterialInterface*> Mats;
	ToClone->StaticMeshComponent->GetUsedMaterials(Mats);
	
	const int32 Total = Mats.Num();
	for(int32 v = 0; v < Total; v++ )
	{
		NewSMA->StaticMeshComponent->SetMaterial(v,Mats[v]);
	}
	
	//~~~
	
	//copy physics state
	if(ToClone->StaticMeshComponent->IsSimulatingPhysics())
	{
		NewSMA->StaticMeshComponent->SetSimulatePhysics(true);
	}
	
	//~~~
	
	//Add Location Offset
	const FVector SpawnLoc = ToClone->GetActorLocation() + LocationOffset;
	NewSMA->SetActorLocation(SpawnLoc);
	
	//Add Rotation offset
	FTransform TheTransform = NewSMA->GetTransform();
	TheTransform.ConcatenateRotation(RotationOffset.Quaternion());
	TheTransform.NormalizeRotation();
	
	//Set Transform
	NewSMA->SetActorTransform(TheTransform);
	
	IsValid = true;
	return NewSMA;
}

bool UVictoryBPFunctionLibrary::Actor__TeleportToActor(AActor* ActorToTeleport, AActor* DestinationActor)
{
	if(!ActorToTeleport) 							return false;
	if(!ActorToTeleport->IsValidLowLevel()) 	return false;
	if(!DestinationActor) 							return false;
	if(!DestinationActor->IsValidLowLevel()) 	return false;
	
	//Set Loc
	ActorToTeleport->SetActorLocation(DestinationActor->GetActorLocation());
	
	//Set Rot
	ActorToTeleport->SetActorRotation(DestinationActor->GetActorRotation());
	
	return true;
}

bool UVictoryBPFunctionLibrary::WorldType__InEditorWorld(UObject* WorldContextObject)
{
	if(!WorldContextObject) return false;
	
	//using a context object to get the world!
    UWorld* const World = GEngine->GetWorldFromContextObject(WorldContextObject);
	if(!World) return false;
	//~~~~~~~~~~~
	
    return (World->WorldType == EWorldType::Editor );
}

bool UVictoryBPFunctionLibrary::WorldType__InPIEWorld(UObject* WorldContextObject)
{
	if(!WorldContextObject) return false;
	
	//using a context object to get the world!
    UWorld* const World = GEngine->GetWorldFromContextObject(WorldContextObject);
	if(!World) return false;
	//~~~~~~~~~~~
	
    return (World->WorldType == EWorldType::PIE );
}
bool UVictoryBPFunctionLibrary::WorldType__InGameInstanceWorld(UObject* WorldContextObject)
{
	if(!WorldContextObject) return false;
	
	//using a context object to get the world!
    UWorld* const World = GEngine->GetWorldFromContextObject(WorldContextObject);
	if(!World) return false;
	//~~~~~~~~~~~
	
    return (World->WorldType == EWorldType::Game );
}
	
FString UVictoryBPFunctionLibrary::Accessor__GetNameAsString(const UObject* TheObject)
{
	if (!TheObject) return "";
	return TheObject->GetName();
}

FRotator UVictoryBPFunctionLibrary::Conversions__VectorToRotator(const FVector& TheVector)
{
	return TheVector.Rotation();
}
FVector UVictoryBPFunctionLibrary::Conversions__RotatorToVector(const FRotator& TheRotator)
{
	return TheRotator.Vector();
}
FRotator UVictoryBPFunctionLibrary::Character__GetControllerRotation(AActor * TheCharacter)
{
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);

	if (!AsCharacter) return FRotator::ZeroRotator;
	
	return AsCharacter->GetControlRotation();
}

//Draw From Socket on Character's Mesh
void UVictoryBPFunctionLibrary::Draw__Thick3DLineFromCharacterSocket(AActor* TheCharacter,  const FVector& EndPoint, FName Socket, FLinearColor LineColor, float Thickness, float Duration)
{
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return;
	if (!AsCharacter->Mesh) return;
	//~~~~~~~~~~~~~~~~~~~~
	
	//Get World
	UWorld* TheWorld = AsCharacter->GetWorld();
	if (!TheWorld) return;
	//~~~~~~~~~~~~~~~~~
	
	const FVector SocketLocation = AsCharacter->Mesh->GetSocketLocation(Socket);
	DrawDebugLine(
		TheWorld, 
		SocketLocation, 
		EndPoint, 
		FColor(LineColor), 
		false, 
		Duration, 
		0, 
		Thickness
	);
	
}
/** Draw 3D Line of Chosen Thickness From Mesh Socket to Destination */
void UVictoryBPFunctionLibrary::Draw__Thick3DLineFromSocket(USkeletalMeshComponent* Mesh, const FVector& EndPoint, FName Socket, FLinearColor LineColor, float Thickness, float Duration)
{
	if (!Mesh) return;
	//~~~~~~~~~~~~~~
	
	//Get an actor to GetWorld() from
	TObjectIterator<APlayerController> Itr;
	if (!Itr) return;
	//~~~~~~~~~~~~
	
	//Get World
	UWorld* TheWorld = Itr->GetWorld();
	if (!TheWorld) return;
	//~~~~~~~~~~~~~~~~~
	
	const FVector SocketLocation = Mesh->GetSocketLocation(Socket);
	
	DrawDebugLine(
		TheWorld, 
		SocketLocation, 
		EndPoint, 
		FColor(LineColor), 
		false, 
		Duration, 
		0, 
		Thickness
	);
}
/** Draw 3D Line of Chosen Thickness Between Two Actors */
void UVictoryBPFunctionLibrary::Draw__Thick3DLineBetweenActors(AActor * StartActor, AActor * EndActor, FLinearColor LineColor, float Thickness, float Duration)
{
	if (!StartActor) return;
	if (!EndActor) return;
	//~~~~~~~~~~~~~~~~
	
	DrawDebugLine(
		StartActor->GetWorld(), 
		StartActor->GetActorLocation(), 
		EndActor->GetActorLocation(), 
		FColor(LineColor), 
		false, 
		Duration, 
		0, 
		Thickness
	);
}
	
bool UVictoryBPFunctionLibrary::Animation__GetAimOffsets(AActor* AnimBPOwner, float& Pitch, float& Yaw)
{
	//Get Owning Character
	ACharacter * TheCharacter = Cast<ACharacter>(AnimBPOwner);
	
	if (!TheCharacter) return false;
	//~~~~~~~~~~~~~~~
	
	//Get Owning Controller Rotation
	const FRotator TheCtrlRotation = TheCharacter->GetControlRotation();
	
	const FVector RotationDir = TheCtrlRotation.Vector();
	
	//Inverse of ActorToWorld matrix is Actor to Local Space
		//so this takes the direction vector, the PC or AI rotation
		//and outputs what this dir is 
		//in local actor space &
		
		//local actor space is what we want for aiming offsets
		
	const FVector LocalDir = TheCharacter->ActorToWorld().InverseTransformVectorNoScale(RotationDir);
	const FRotator LocalRotation = LocalDir.Rotation();
		
	//Pass out Yaw and Pitch
	Yaw = LocalRotation.Yaw;
	Pitch = LocalRotation.Pitch;
	
	return true;
}
bool UVictoryBPFunctionLibrary::Animation__GetAimOffsetsFromRotation(AActor * AnimBPOwner, const FRotator & TheRotation, float & Pitch, float & Yaw)
{
	//Get Owning Character
	ACharacter * TheCharacter = Cast<ACharacter>(AnimBPOwner);
	
	if (!TheCharacter) return false;
	//~~~~~~~~~~~~~~~
	
	//using supplied rotation
	const FVector RotationDir = TheRotation.Vector();
	
	//Inverse of ActorToWorld matrix is Actor to Local Space
		//so this takes the direction vector, the PC or AI rotation
		//and outputs what this dir is 
		//in local actor space &
		
		//local actor space is what we want for aiming offsets
		
	const FVector LocalDir = TheCharacter->ActorToWorld().InverseTransformVectorNoScale(RotationDir);
	const FRotator LocalRotation = LocalDir.Rotation();
		
	//Pass out Yaw and Pitch
	Yaw = LocalRotation.Yaw;
	Pitch = LocalRotation.Pitch;
	
	return true;
}

void UVictoryBPFunctionLibrary::Visibility__GetRenderedActors(TArray<AActor*>& CurrentlyRenderedActors, float MinRecentTime)
{
	//Empty any previous entries
	CurrentlyRenderedActors.Empty();
	
	//Iterate Over Actors
	for ( TObjectIterator<AActor> Itr; Itr; ++Itr )
	{
		if (Itr->GetLastRenderTime() > MinRecentTime)
		{
			CurrentlyRenderedActors.Add( * Itr);
		}
	}
}
void UVictoryBPFunctionLibrary::Visibility__GetNotRenderedActors(TArray<AActor*>& CurrentlyNotRenderedActors, float MinRecentTime)
{
	//Empty any previous entries
	CurrentlyNotRenderedActors.Empty();
	
	//Iterate Over Actors
	for ( TObjectIterator<AActor> Itr; Itr; ++Itr )
	{
		if (Itr->GetLastRenderTime() <= MinRecentTime)
		{
			CurrentlyNotRenderedActors.Add( * Itr);
		}
	}
}

void UVictoryBPFunctionLibrary::Rendering__FreezeGameRendering()
{
	FViewport::SetGameRenderingEnabled(false);
}
void UVictoryBPFunctionLibrary::Rendering__UnFreezeGameRendering()
{
	FViewport::SetGameRenderingEnabled(true);
}
	
bool UVictoryBPFunctionLibrary::ClientWindow__GameWindowIsForeGroundInOS()
{
	//Iterate Over Actors
	UWorld* TheWorld = NULL;
	for ( TObjectIterator<AActor> Itr; Itr; ++Itr )
	{
		TheWorld = Itr->GetWorld();
		if (TheWorld) break;
		//~~~~~~~~~~~~~~~~~~~~~~~
	}
	//Get Player
	ULocalPlayer* VictoryPlayer = 
            TheWorld->GetFirstLocalPlayerFromController(); 

	if (!VictoryPlayer) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	//get view port ptr
	UGameViewportClient * VictoryViewportClient = 
		Cast < UGameViewportClient > (VictoryPlayer->ViewportClient);
		
	if (!VictoryViewportClient) return false;
	//~~~~~~~~~~~~~~~~~~~~
	 
	FViewport * VictoryViewport = VictoryViewportClient->Viewport;
	
	if (!VictoryViewport) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
    return VictoryViewport->IsForegroundWindow();
}
bool UVictoryBPFunctionLibrary::FileIO__SaveStringTextToFile(
	FString SaveDirectory, 
	FString JoyfulFileName, 
	FString SaveText,
	bool AllowOverWriting
){
	//Dir Exists?
	if ( !FPlatformFileManager::Get().GetPlatformFile().DirectoryExists( *SaveDirectory))
	{
		//create directory if it not exist
		FPlatformFileManager::Get().GetPlatformFile().CreateDirectory( *SaveDirectory);
		
		//still could not make directory?
		if (!FPlatformFileManager::Get().GetPlatformFile().DirectoryExists( *SaveDirectory))
		{
			//Could not make the specified directory
			return false;
			//~~~~~~~~~~~~~~~~~~~~~~
		}
	}
	
	//get complete file path
	SaveDirectory += "\\";
	SaveDirectory += JoyfulFileName;
	
	//No over-writing?
	if (!AllowOverWriting)
	{
		//Check if file exists already
		if (FPlatformFileManager::Get().GetPlatformFile().FileExists( * SaveDirectory))
		{
			//no overwriting
			return false;
		}
	}
	
	return FFileHelper::SaveStringToFile(SaveText, * SaveDirectory);
}

float UVictoryBPFunctionLibrary::Calcs__ClosestPointToSourcePoint(const FVector & Source, const TArray<FVector>& OtherPoints, FVector& ClosestPoint)
{
	float CurDist = 0;
	float ClosestDistance = -1;
	int32 ClosestVibe = 0;
	ClosestPoint = FVector::ZeroVector;
	
	if (OtherPoints.Num() <= 0) return ClosestDistance;
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	for (int32 Itr = 0; Itr < OtherPoints.Num(); Itr++)
	{
		if (Source == OtherPoints[Itr]) continue;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		//Dist
		CurDist = FVector::Dist(Source, OtherPoints[Itr]);
		
		//Min
		if (ClosestDistance < 0 || ClosestDistance >= CurDist)
		{
			ClosestVibe = Itr;
			ClosestDistance = CurDist;
		}
	}
	
	//Out
	ClosestPoint = OtherPoints[ClosestVibe];
	return ClosestDistance;
}

bool UVictoryBPFunctionLibrary::Data__GetCharacterBoneLocations(AActor * TheCharacter, TArray<FVector>& BoneLocations)
{
	ACharacter * Source = Cast<ACharacter>(TheCharacter);
	if (!Source) return false;
	
	if (!Source-> Mesh) return false;
	//~~~~~~~~~~~~~~~~~~~~~~~~~
	TArray<FName> BoneNames;
	
	//Get Bone Names
	Source-> Mesh->GetBoneNames(BoneNames);
	
	//Get Bone Locations
	for (int32 Itr = 0; Itr < BoneNames.Num(); Itr++ )
	{
		BoneLocations.Add(Source->Mesh->GetBoneLocation(BoneNames[Itr]));
	}
	
	return true;
}

USkeletalMeshComponent* UVictoryBPFunctionLibrary::Accessor__GetCharacterSkeletalMesh(AActor * TheCharacter, bool& IsValid)
{
	IsValid = false;
	
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return NULL;
	//~~~~~~~~~~~~~~~~~
	
	//Is Valid?
	if (AsCharacter->Mesh)
		if (AsCharacter->Mesh->IsValidLowLevel() ) 
			IsValid = true;
			
	return AsCharacter->Mesh;
}

bool UVictoryBPFunctionLibrary::TraceData__GetTraceDataFromCharacterSocket(
	FVector & TraceStart, //out
	FVector & TraceEnd,	//out
	AActor * TheCharacter,
	const FRotator& TraceRotation, 
	float TraceLength,
	FName Socket, 
	bool DrawTraceData, 
	FLinearColor TraceDataColor, 
	float TraceDataThickness
) {
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	//Mesh Exists?
	if (!AsCharacter->Mesh) return false;
	
	//Socket Exists?
	if (!AsCharacter->Mesh->DoesSocketExist(Socket)) return false;
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	TraceStart = AsCharacter->Mesh->GetSocketLocation(Socket);
	TraceEnd = TraceStart + TraceRotation.Vector() * TraceLength;
	
	if (DrawTraceData) 
	{
		//Get World
		UWorld* TheWorld = AsCharacter->GetWorld();
		if (!TheWorld) return false;
		//~~~~~~~~~~~~~~~~~
	
		DrawDebugLine(
			TheWorld, 
			TraceStart, 
			TraceEnd, 
			FColor(TraceDataColor), 
			false, 
			0.0333, 
			0, 
			TraceDataThickness
		);
	}
	
	return true;
}
bool UVictoryBPFunctionLibrary::TraceData__GetTraceDataFromSkeletalMeshSocket(
	FVector & TraceStart, //out
	FVector & TraceEnd,	//out
	USkeletalMeshComponent * Mesh,
	const FRotator & TraceRotation,	
	float TraceLength,
	FName Socket, 
	bool DrawTraceData, 
	FLinearColor TraceDataColor, 
	float TraceDataThickness
) {
	//Mesh Exists?
	if (!Mesh) return false;
	
	//Socket Exists?
	if (!Mesh->DoesSocketExist(Socket)) return false;
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	TraceStart = Mesh->GetSocketLocation(Socket);
	TraceEnd = TraceStart + TraceRotation.Vector() * TraceLength;
	
	if (DrawTraceData) 
	{
		//Get a PC to GetWorld() from
		TObjectIterator<APlayerController> Itr;
		if (!Itr) return false;
		
		//~~~~~~~~~~~~
		
		//Get World
		UWorld* TheWorld = Itr->GetWorld();
		if (!TheWorld) return false;
		//~~~~~~~~~~~~~~~~~
	
		DrawDebugLine(
			TheWorld, 
			TraceStart, 
			TraceEnd, 
			FColor(TraceDataColor), 
			false, 
			0.0333, 
			0, 
			TraceDataThickness
		);
	}
	
	return true;
}
AActor*  UVictoryBPFunctionLibrary::Traces__CharacterMeshTrace___ClosestBone(
	AActor* TraceOwner,
	const FVector & TraceStart, 
	const FVector & TraceEnd, 
	FVector & OutImpactPoint, 
	FVector & OutImpactNormal, 
	FName & ClosestBoneName,
	FVector & ClosestBoneLocation,
	bool& IsValid
)
{
	IsValid = false;
	AActor * HitActor = NULL;
	//~~~~~~~~~~~~~~~~~~~~~~
	
	//Get a PC to GetWorld() from
	TObjectIterator<APlayerController> Itr;
	if (!Itr) return NULL;
	
	//~~~~~~~~~~~~
	
	//Get World
	UWorld* TheWorld = Itr->GetWorld();
	if (!TheWorld) return NULL;
	//~~~~~~~~~~~~~~~~~
	
	
	//Simple Trace First
	FCollisionQueryParams TraceParams(FName(TEXT("VictoryBPTrace::CharacterMeshTrace")), true, HitActor);
	TraceParams.bTraceComplex = true;
	TraceParams.bTraceAsyncScene = true;
	TraceParams.bReturnPhysicalMaterial = false;
	TraceParams.AddIgnoredActor(TraceOwner);
	
	//initialize hit info
	FHitResult RV_Hit(ForceInit);
	
	TheWorld->LineTraceSingle(
		RV_Hit,		//result
		TraceStart, 
		TraceEnd, 
		ECC_Pawn, //collision channel
		TraceParams
	);
		
	//Hit Something!
	if (!RV_Hit.bBlockingHit) return HitActor;
	
	
	//Character?
	HitActor = RV_Hit.GetActor();
	ACharacter * AsCharacter = Cast<ACharacter>(HitActor);
	if (!AsCharacter) return HitActor;
	
	//Mesh
	if (!AsCharacter->Mesh) return HitActor;
	
	//Component Trace
	if (! AsCharacter->Mesh->K2_LineTraceComponent(
		TraceStart, 
		TraceEnd, 
		true, 
		false, 
		OutImpactPoint, 
		OutImpactNormal
	)) return HitActor;
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//					Bone Names
	TArray<FName> BoneNames;
	
	//Get Bone Names
	AsCharacter->Mesh->GetBoneNames(BoneNames);
	
	//						Min
	FVector CurLoc;
	float CurDist = 0;
	float ClosestDistance = -1;
	int32 ClosestVibe = 0;

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//Check All Bones Locations
	for (int32 Itr = 0; Itr < BoneNames.Num(); Itr++ )
	{
		CurLoc = AsCharacter->Mesh->GetBoneLocation(BoneNames[Itr]);
		
		//Dist
		CurDist = FVector::Dist(OutImpactPoint, CurLoc);
		
		//Min
		if (ClosestDistance < 0 || ClosestDistance >= CurDist)
		{
			ClosestVibe = Itr;
			ClosestDistance = CurDist;
		}
	}
	
	//Name
	ClosestBoneName = BoneNames[ClosestVibe];
	
	//Location
	ClosestBoneLocation = AsCharacter->Mesh->GetBoneLocation(ClosestBoneName);
	
	//Valid
	IsValid = true;
	
	//Actor
	return HitActor;
}

AActor* UVictoryBPFunctionLibrary::Traces__CharacterMeshTrace___ClosestSocket(
	const AActor * TraceOwner, 
	const FVector & TraceStart, 
	const FVector & TraceEnd, 
	FVector & OutImpactPoint, 
	FVector & OutImpactNormal, 
	FName & ClosestSocketName, 
	FVector & SocketLocation, 
	bool & IsValid
)
{
	IsValid = false;
	AActor * HitActor = NULL;
	//~~~~~~~~~~~~~~~~~~~~~~
	
	//There may not be a trace owner so dont rely on it
	
	//Get a PC to GetWorld() from
	TObjectIterator<APlayerController> Itr;
	if (!Itr) return NULL;
	
	//~~~~~~~~~~~~
	
	//Get World
	UWorld* TheWorld = Itr->GetWorld();
	if (!TheWorld) return NULL;
	//~~~~~~~~~~~~~~~~~
	
	
	//Simple Trace First
	FCollisionQueryParams TraceParams(FName(TEXT("VictoryBPTrace::CharacterMeshSocketTrace")), true, HitActor);
	TraceParams.bTraceComplex = true;
	TraceParams.bTraceAsyncScene = true;
	TraceParams.bReturnPhysicalMaterial = false;
	TraceParams.AddIgnoredActor(TraceOwner);
	
	//initialize hit info
	FHitResult RV_Hit(ForceInit);
	
	TheWorld->LineTraceSingle(
		RV_Hit,		//result
		TraceStart, 
		TraceEnd, 
		ECC_Pawn, //collision channel
		TraceParams
	);
		
	//Hit Something!
	if (!RV_Hit.bBlockingHit) return HitActor;
	
	
	//Character?
	HitActor = RV_Hit.GetActor();
	ACharacter * AsCharacter = Cast<ACharacter>(HitActor);
	if (!AsCharacter) return HitActor;
	
	//Mesh
	if (!AsCharacter->Mesh) return HitActor;
	
	//Component Trace
	if (! AsCharacter->Mesh->K2_LineTraceComponent(
		TraceStart, 
		TraceEnd, 
		true, 
		false, 
		OutImpactPoint, 
		OutImpactNormal
	)) return HitActor;
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//					Socket Names
	TArray<FComponentSocketDescription> SocketNames;
	
	//Get Bone Names
	AsCharacter->Mesh->QuerySupportedSockets(SocketNames);
	
	//						Min
	FVector CurLoc;
	float CurDist = 0;
	float ClosestDistance = -1;
	int32 ClosestVibe = 0;
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//Check All Bones Locations
	for (int32 Itr = 0; Itr < SocketNames.Num(); Itr++ )
	{
		//Is this a Bone not a socket?
		if(SocketNames[Itr].Type == EComponentSocketType::Bone) continue;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		CurLoc = AsCharacter->Mesh->GetSocketLocation(SocketNames[Itr].Name);
		
		//Dist
		CurDist = FVector::Dist(OutImpactPoint, CurLoc);
		
		//Min
		if (ClosestDistance < 0 || ClosestDistance >= CurDist)
		{
			ClosestVibe = Itr;
			ClosestDistance = CurDist;
		}
	}
	
	//Name
	ClosestSocketName = SocketNames[ClosestVibe].Name;
	
	//Location
	SocketLocation = AsCharacter->Mesh->GetSocketLocation(ClosestSocketName);
	
	//Valid
	IsValid = true;
	
	//Actor
	return HitActor;
}
	
//Most HUD stuff is in floats so I do the conversion internally
bool UVictoryBPFunctionLibrary::Viewport__SetMousePosition(const APlayerController* ThePC, const float& PosX, const float& PosY)
{
	if (!ThePC) return false;
	//~~~~~~~~~~~~~
	
	//Get Player
	const ULocalPlayer * VictoryPlayer = Cast<ULocalPlayer>(ThePC->Player); 
											//PlayerController::Player is UPlayer
           
	if (!VictoryPlayer) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	//get view port ptr
	const UGameViewportClient * VictoryViewportClient = 
		Cast < UGameViewportClient > (VictoryPlayer->ViewportClient);
		
	if (!VictoryViewportClient) return false;
	//~~~~~~~~~~~~~~~~~~~~
	 
	FViewport * VictoryViewport = VictoryViewportClient->Viewport;
	
	if (!VictoryViewport) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	//Set Mouse
	VictoryViewport->SetMouse(int32(PosX), int32(PosY));
	
	return true;
}

APlayerController * UVictoryBPFunctionLibrary::Accessor__GetPlayerController(
	AActor * TheCharacter, 
	bool & IsValid
)
{
	IsValid = false;
	
	//Cast to Character
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return NULL;
	
	//cast to PC
	APlayerController * ThePC = Cast < APlayerController > (AsCharacter->GetController());
	
	if (!ThePC ) return NULL;
	
	IsValid = true;
	return ThePC;
}
	
bool UVictoryBPFunctionLibrary::Viewport__GetCenterOfViewport(const APlayerController * ThePC, float & PosX, float & PosY)
{
	if (!ThePC) return false;
	//~~~~~~~~~~~~~
	
	//Get Player
	const ULocalPlayer * VictoryPlayer = Cast<ULocalPlayer>(ThePC->Player); 
											//PlayerController::Player is UPlayer
           
	if (!VictoryPlayer) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	//get view port ptr
	const UGameViewportClient * VictoryViewportClient = 
		Cast < UGameViewportClient > (VictoryPlayer->ViewportClient);
		
	if (!VictoryViewportClient) return false;
	//~~~~~~~~~~~~~~~~~~~~
	 
	FViewport * VictoryViewport = VictoryViewportClient->Viewport;
	
	if (!VictoryViewport) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	//Get Size
	FIntPoint Size = VictoryViewport->GetSizeXY();
	
	//Center
	PosX = Size.X / 2;
	PosY = Size.Y / 2;
	
	return true;
}

bool UVictoryBPFunctionLibrary::Viewport__GetMousePosition(const APlayerController * ThePC, float & PosX, float & PosY)
{
	if (!ThePC) return false;
	//~~~~~~~~~~~~~
	
	//Get Player
	const ULocalPlayer * VictoryPlayer = Cast<ULocalPlayer>(ThePC->Player); 
											//PlayerController::Player is UPlayer
           
	if (!VictoryPlayer) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	//get view port ptr
	const UGameViewportClient * VictoryViewportClient = 
		Cast < UGameViewportClient > (VictoryPlayer->ViewportClient);
		
	if (!VictoryViewportClient) return false;
	//~~~~~~~~~~~~~~~~~~~~
	 
	FViewport * VictoryViewport = VictoryViewportClient->Viewport;
	
	if (!VictoryViewport) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	PosX = float(VictoryViewport->GetMouseX());
	PosY = float(VictoryViewport->GetMouseY());
	
	return true;
}





bool UVictoryBPFunctionLibrary::Physics__EnterRagDoll(AActor * TheCharacter)
{
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	//Mesh?
	if (!AsCharacter->Mesh) return false;
	
	//Physics Asset?
	if(!AsCharacter->Mesh->GetPhysicsAsset()) return false;
	
	//Victory Ragdoll
	AsCharacter->Mesh->SetPhysicsBlendWeight(1);
	AsCharacter->Mesh->bBlendPhysics = true;
	
	return true;
}


bool UVictoryBPFunctionLibrary::Physics__LeaveRagDoll(
	AActor* TheCharacter,
	float HeightAboveRBMesh,
	const FVector& InitLocation, 
	const FRotator& InitRotation
){
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	//Mesh?
	if (!AsCharacter->Mesh) return false;
	
	//Set Actor Location to Be Near Ragdolled Mesh
	//Calc Ref Bone Relative Pos for use with IsRagdoll
	TArray<FName> BoneNames;
	AsCharacter->Mesh->GetBoneNames(BoneNames);
	if(BoneNames.Num() > 0)
	{
		AsCharacter->SetActorLocation(FVector(0,0,HeightAboveRBMesh) + AsCharacter->Mesh->GetBoneLocation(BoneNames[0]));
	}
	
	//Exit Ragdoll
	AsCharacter->Mesh->SetPhysicsBlendWeight(0); //1 for full physics

	//Restore Defaults
	AsCharacter->Mesh->SetRelativeRotation(InitRotation);
	AsCharacter->Mesh->SetRelativeLocation(InitLocation);
	
	//Set Falling After Final Capsule Relocation
	if(AsCharacter->CharacterMovement) AsCharacter->CharacterMovement->SetMovementMode(MOVE_Falling);	
	
	return true;
}	

bool UVictoryBPFunctionLibrary::Physics__IsRagDoll(AActor* TheCharacter)
{
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	//Mesh?
	if (!AsCharacter->Mesh) return false;
	
	return AsCharacter->Mesh->IsAnySimulatingPhysics();
}	

bool UVictoryBPFunctionLibrary::Physics__GetLocationofRagDoll(AActor* TheCharacter, FVector& RagdollLocation)
{
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	//Mesh?
	if (!AsCharacter->Mesh) return false;
	
	TArray<FName> BoneNames;
	AsCharacter->Mesh->GetBoneNames(BoneNames);
	if(BoneNames.Num() > 0)
	{
		RagdollLocation = AsCharacter->Mesh->GetBoneLocation(BoneNames[0]);
	}
	else return false;
	
	return true;
}

bool UVictoryBPFunctionLibrary::Physics__InitializeVictoryRagDoll(
	AActor* TheCharacter, 
	FVector& InitLocation, 
	FRotator& InitRotation
){
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	//Mesh?
	if (!AsCharacter->Mesh) return false;
	
	InitLocation = AsCharacter->Mesh->GetRelativeTransform().GetLocation();
	InitRotation = AsCharacter->Mesh->GetRelativeTransform().Rotator();
	
	return true;
}

bool UVictoryBPFunctionLibrary::Physics__UpdateCharacterCameraToRagdollLocation(
	AActor* TheCharacter, 
	float HeightOffset,
	float InterpSpeed
){
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	//Mesh?
	if (!AsCharacter->Mesh) return false;
	
	//Ragdoll?
	if(!AsCharacter->Mesh->IsAnySimulatingPhysics()) return false;
	
	FVector RagdollLocation = FVector(0,0,0);
	TArray<FName> BoneNames;
	AsCharacter->Mesh->GetBoneNames(BoneNames);
	if(BoneNames.Num() > 0)
	{
		RagdollLocation = AsCharacter->Mesh->GetBoneLocation(BoneNames[0]);
	}
	
	//Interp
	RagdollLocation = FMath::VInterpTo(AsCharacter->GetActorLocation(), RagdollLocation + FVector(0,0,HeightOffset), AsCharacter->GetWorld()->DeltaTimeSeconds, InterpSpeed);

	//Set Loc
	AsCharacter->SetActorLocation(RagdollLocation);
	
	return true;
}
/*
bool UVictoryBPFunctionLibrary::Accessor__GetSocketLocalTransform(const USkeletalMeshComponent* Mesh, FTransform& LocalTransform, FName SocketName)
{
	if(!Mesh) return false;
	
	LocalTransform =  Mesh->GetSocketLocalTransform(SocketName);
	
	return true;
}
*/

void UVictoryBPFunctionLibrary::StringConversion__GetFloatAsStringWithPrecision(float TheFloat, FString & TheString, uint8 Precision)
{
	TheFloat *= FMath::Pow(10, Precision);
		
	//Rounded int32
	TheString = FString::FromInt(FGenericPlatformMath::Round(TheFloat));
	
	//Out
	TheString = TheString.Left(TheString.Len() - Precision ) + "." + TheString.Right(Precision);
}

bool UVictoryBPFunctionLibrary::LensFlare__GetLensFlareOffsets(
	APlayerController* PlayerController,
	AActor* LightSource, 
	float& PitchOffset, 
	float& YawOffset, 
	float& RollOffset
){
	if(!PlayerController) return false;
	if(!LightSource) return false;
	//~~~~~~~~~~~~~~~~~~~
	
	//angle from player to light source
	const FRotator AngleToLightSource = (LightSource->GetActorLocation() - PlayerController->GetFocalLocation()).Rotation();
	
	const FRotator Offsets = AngleToLightSource - PlayerController->GetControlRotation();
	
	PitchOffset = Offsets.Pitch;
	YawOffset = Offsets.Yaw;
	RollOffset = Offsets.Roll;
	return true;
}

/*
bool UVictoryBPFunctionLibrary::AnimatedVertex__GetAnimatedVertexLocations(
	USkeletalMeshComponent* Mesh, 
	TArray<FVector>& Locations
)
{
	if(!Mesh) return false;
	if(!Mesh->SkeletalMesh) return false;
	//~~~~~~~~~
	
	Locations.Empty(); 
	//~~~~~~~~~~~~~~~~~~~
	
	//	Get the Verticies For Each Bone, Most Influenced by That Bone!
	//					Vertices are in Bone space.
	TArray<FBoneVertInfo> BoneVertexInfos;
	FSkeletalMeshTools::CalcBoneVertInfos(Mesh->SkeletalMesh,BoneVertexInfos,true); //true = only dominant influence
	
	//~~~~~~~~~~~~~~~~~~~~~
	int32 VertItr = 0;
	FBoneVertInfo* EachBoneVertInfo;
	FVector BoneWorldPos;
	int32 NumOfVerticies;
	FTransform RV_Transform;
	FVector RV_Vect;
	for(int32 Itr=0; Itr < BoneVertexInfos.Num() ; Itr++)
	{
		EachBoneVertInfo = &BoneVertexInfos[Itr];
		//~~~~~~~~~~~~~~~~~~~~~~~~
		
		//Bone Transform To World Space, and Location
		RV_Transform = Mesh->GetBoneTransform(Itr);
		BoneWorldPos = RV_Transform.GetLocation();
		
		//How many verts is this bone influencing?
		NumOfVerticies = EachBoneVertInfo->Positions.Num();
		for(VertItr=0; VertItr < NumOfVerticies ; VertItr++)
		{
			//Animated Vertex Location!
			Locations.Add(  BoneWorldPos + RV_Transform.TransformVector(EachBoneVertInfo->Positions[VertItr])  );
		}
	}
	
	//~~~ Cleanup ~~~
	BoneVertexInfos.Empty();
	
	return true;
}
	
bool UVictoryBPFunctionLibrary::AnimatedVertex__GetAnimatedVertexLocationsAndNormals(
	USkeletalMeshComponent* Mesh, 
	TArray<FVector>& Locations, 
	TArray<FVector>& Normals 
)
{
	if(!Mesh) return false;
	if(!Mesh->SkeletalMesh) return false;
	//~~~~~~~~~
	
	Locations.Empty(); 
	Normals.Empty();
	//~~~~~~~~~~~~~~~~~~~
	
	//	Get the Verticies For Each Bone, Most Influenced by That Bone!
	//					Vertices are in Bone space.
	TArray<FBoneVertInfo> BoneVertexInfos;
	FSkeletalMeshTools::CalcBoneVertInfos(Mesh->SkeletalMesh,BoneVertexInfos,true); //true = only dominant influence
	
	//~~~~~~~~~~~~~~~~~~~~~
	int32 VertItr = 0;
	FBoneVertInfo* EachBoneVertInfo;
	FVector BoneWorldPos;
	int32 NumOfVerticies;
	FTransform RV_Transform;
	FVector RV_Vect;
	for(int32 Itr=0; Itr < BoneVertexInfos.Num() ; Itr++)
	{
		EachBoneVertInfo = &BoneVertexInfos[Itr];
		//~~~~~~~~~~~~~~~~~~~~~~~~
		
		//Bone Transform To World Space, and Location
		RV_Transform = Mesh->GetBoneTransform(Itr);
		BoneWorldPos = RV_Transform.GetLocation();
		
		//How many verts is this bone influencing?
		NumOfVerticies = EachBoneVertInfo->Positions.Num();
		for(VertItr=0; VertItr < NumOfVerticies ; VertItr++)
		{
			//Animated Vertex Location!
			Locations.Add(  BoneWorldPos + RV_Transform.TransformVector(EachBoneVertInfo->Positions[VertItr])  );
		
			//Animated Vertex Normal for rotating the emitter!!!!!
			Normals.Add(  RV_Transform.TransformVector(EachBoneVertInfo->Normals[VertItr])  );
		}
	}
	
	//~~~ Cleanup ~~~
	BoneVertexInfos.Empty();
	
	return true;
}
	
bool UVictoryBPFunctionLibrary::AnimatedVertex__DrawAnimatedVertexLocations(
	UObject* WorldContextObject,
	USkeletalMeshComponent* Mesh, 
	float ChanceToSkipAVertex, 
	bool DrawNormals
)
{
	UWorld* const TheWorld = GEngine->GetWorldFromContextObject(WorldContextObject);
	
	if(!TheWorld) return false;
	if(!Mesh) return false;
	if(!Mesh->SkeletalMesh) return false;
	//~~~~~~~~~
	
	//	Get the Verticies For Each Bone, Most Influenced by That Bone!
	//					Vertices are in Bone space.
	TArray<FBoneVertInfo> BoneVertexInfos;
	FSkeletalMeshTools::CalcBoneVertInfos(Mesh->SkeletalMesh,BoneVertexInfos,true); //true = only dominant influence
	
	//~~~~~~~~~~~~~~~~~~~~~
	int32 VertItr = 0;
	FBoneVertInfo* EachBoneVertInfo;
	FVector BoneWorldPos;
	int32 NumOfVerticies;
	FTransform RV_Transform;
	FVector RV_Vect;
	
	const FColor HappyRed = FColor(255,0,0);
	const FColor HappyBlue = FColor(0,0,255);
	for(int32 Itr=0; Itr < BoneVertexInfos.Num() ; Itr++)
	{
		EachBoneVertInfo = &BoneVertexInfos[Itr];
		//~~~~~~~~~~~~~~~~~~~~~~~~
		
		//Bone Transform To World Space, and Location
		RV_Transform = Mesh->GetBoneTransform(Itr);
		BoneWorldPos = RV_Transform.GetLocation();
		
		//How many verts is this bone influencing?
		NumOfVerticies = EachBoneVertInfo->Positions.Num();
		for(VertItr=0; VertItr < NumOfVerticies ; VertItr++)
		{
			if(FMath::FRandRange(0, 1) < ChanceToSkipAVertex) continue;
			//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			
			RV_Vect = BoneWorldPos + RV_Transform.TransformVector(EachBoneVertInfo->Positions[VertItr]);
			
			DrawDebugPoint(
				TheWorld, 
				RV_Vect,
				12, 
				HappyRed, 
				false, 
				0.03
			);
			
			if(DrawNormals)
			{
			DrawDebugLine(
				TheWorld, 
				RV_Vect, 
				RV_Vect + RV_Transform.TransformVector(EachBoneVertInfo->Normals[VertItr] * 64),  
				HappyBlue, 
				false, 
				0.03, 
				0, 
				1
			);
			}
		}
	}
	
	//~~~ Cleanup ~~~
	BoneVertexInfos.Empty();
	
	return true;
}
	
bool UVictoryBPFunctionLibrary::AnimatedVertex__GetCharacterAnimatedVertexLocations(
	AActor* TheCharacter, 
	TArray<FVector>& Locations
)
{
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	USkeletalMeshComponent* Mesh = AsCharacter->Mesh;
	if (!Mesh) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	AnimatedVertex__GetAnimatedVertexLocations(Mesh,Locations);
	
	return true;
}
	
bool UVictoryBPFunctionLibrary::AnimatedVertex__GetCharacterAnimatedVertexLocationsAndNormals(
	AActor* TheCharacter, 
	TArray<FVector>& Locations, 
	TArray<FVector>& Normals 
)
{
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	USkeletalMeshComponent* Mesh = AsCharacter->Mesh;
	if (!Mesh) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	AnimatedVertex__GetAnimatedVertexLocationsAndNormals(Mesh,Locations,Normals);
	
	return true;
}
	
bool UVictoryBPFunctionLibrary::AnimatedVertex__DrawCharacterAnimatedVertexLocations(
	AActor* TheCharacter, 
	float ChanceToSkipAVertex, 
	bool DrawNormals
)
{	
	ACharacter * AsCharacter = Cast<ACharacter>(TheCharacter);
	if (!AsCharacter) return false;
	
	USkeletalMeshComponent* Mesh = AsCharacter->Mesh;
	if (!Mesh) return false;
	//~~~~~~~~~~~~~~~~~~~~
	
	AnimatedVertex__DrawAnimatedVertexLocations(TheCharacter,Mesh,ChanceToSkipAVertex,DrawNormals);
	
	return true;
}
*/

//SMA Version
float UVictoryBPFunctionLibrary::DistanceToSurface__DistaceOfPointToMeshSurface(AStaticMeshActor* TheSMA, const FVector& TestPoint, FVector& ClosestSurfacePoint)
{
	if(!TheSMA) return -1;
	if(!TheSMA->StaticMeshComponent) return -1;
	//~~~~~~~~~~
	
	//Dist of pt to Surface, retrieve closest Surface Point to Actor
	return TheSMA->StaticMeshComponent->GetDistanceToCollision(TestPoint, ClosestSurfacePoint);
}

bool UVictoryBPFunctionLibrary::Mobility__SetSceneCompMobility(
	USceneComponent* SceneComp,
	EComponentMobility::Type NewMobility
)
{
	if(!SceneComp) return false;
	//~~~~~~~~~~~
	
	SceneComp->SetMobility(NewMobility);
	
	return true;
}