// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.

#pragma once

#include "VictoryBPFunctionLibrary.generated.h"

// BP Library for You
//
// Written by Rama

//note about UBlueprintFunctionLibrary
// This class is a base class for any function libraries exposed to blueprints.
// Methods in subclasses are expected to be static, and no methods should be added to the base class.

UCLASS()
class VICTORYBPLIBRARY_API UVictoryBPFunctionLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_UCLASS_BODY()
	
	/** Returns which platform the game code is running in.*/
	UFUNCTION(BlueprintCallable, BlueprintPure, Category = "VictoryBPLibrary")
	static void OperatingSystem__GetCurrentPlatform(
		bool& Windows_, 
		bool& Mac,
		bool& Linux, 
		bool& iOS, 
		bool& Android,
		bool& PS4,
		bool& XBoxOne,
		bool& HTML5,
		bool& WinRT_Arm,
		bool& WinRT
	);
	
	//~~~
	
	/** Retrieves the OS system Date and Time as a string at the instant this BP node runs. Use my other RealWorldTime node to get the time passed since the return value of this node! You can use this to record milliseconds/seconds/minutes/hours between events in game logic! */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category = "VictoryBPLibrary")
	static FString RealWorldTime__GetCurrentOSTime( 
		int32& MilliSeconds,
		int32& Seconds, 
		int32& Minutes, 
		int32& Hours12,
		int32& Hours24,
		int32& Day,
		int32& Month,
		int32& Year
	);
	
	/** Get the amount of seconds/minutes/hours since the the supplied DateTime string! You can use this to record milliseconds/seconds/minutes/hours between events in game logic! */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category = "VictoryBPLibrary")
	static void RealWorldTime__GetTimePassedSincePreviousTime(
		const FString& PreviousTime,
		float& Milliseconds,
		float& Seconds,
		float& Minutes,
		float& Hours
	);
	
	/** Get the difference between two recorded times! You can use this to record milliseconds/seconds/minutes/hours between events in game logic! */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category = "VictoryBPLibrary")
	static void RealWorldTime__GetDifferenceBetweenTimes(
		const FString& PreviousTime1,
		const FString& PreviousTime2,
		float& Milliseconds,
		float& Seconds,
		float& Minutes,
		float& Hours
	);
	
	//~~~
	
	
	/** Converts a float to a rounded Integer, examples: 1.4 becomes 1,   1.6 becomes 2 */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category = "VictoryBPLibrary")
	static int32 Conversion__FloatToRoundedInteger(float IN_Float);
	
	/** Combines two strings together! The Separator and the Labels are optional*/
	UFUNCTION(BlueprintCallable, BlueprintPure, Category = "VictoryBPLibrary")
	static FString String__CombineStrings(FString StringFirst, FString StringSecond, FString Separator="", FString StringFirstLabel="", FString StringSecondLabel="");
	
	
	/** Returns three arrays containing all of the resolutions and refresh rates for the current computer's current display adapter. You can loop over just 1 of the arrays and use the current index for the other two arrays, as all 3 arrays will always have the same length. Returns false if operation could not occur. */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category = "VictoryBPLibrary")
	static bool OptionsMenu__GetDisplayAdapterScreenResolutions(TArray<int32>& Widths, TArray<int32>& Heights, TArray<int32>& RefreshRates, bool IncludeRefreshRates=false);
	
	/** Clones an actor by obtaining its class and creating a copy. Returns the created Actor. The cloned actor is set to have the rotation and location of the initial actor. You can optionally specify location / rotation offsets for the new clone from original actor. Use IsValid to know if the actor was able to be cloned. */
	UFUNCTION(BlueprintCallable, Category="VictoryBPLibrary", meta=(HidePin="WorldContextObject", DefaultToSelf="WorldContextObject" ) )
	static AStaticMeshActor* Clone__StaticMeshActor(UObject* WorldContextObject, bool&IsValid, AStaticMeshActor* ToClone, FVector LocationOffset=FVector(0,0,0), FRotator RotationOffset=FRotator(0,0,0));
	
	
	/** Teleport Actor To Actor. Moves an actor instantly to the position and rotation of another actor. Useful for player starts, notes, triggers, and any other destination actors who dont have collision. Returns false if the operation could not occur. */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category="VictoryBPLibrary")
	static bool Actor__TeleportToActor(AActor* ActorToTeleport, AActor* DestinationActor);
	
	/** Is this game logic running in the Editor world? */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category="VictoryBPLibrary", meta=(HidePin="WorldContextObject", DefaultToSelf="WorldContextObject" ) )
	static bool WorldType__InEditorWorld(UObject* WorldContextObject);
	
	/** Is this game logic running in the PIE world? */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category="VictoryBPLibrary", meta=(HidePin="WorldContextObject", DefaultToSelf="WorldContextObject" ) )
	static bool WorldType__InPIEWorld(UObject* WorldContextObject);
	
	/** Is this game logic running in an actual independent game instance? */
	UFUNCTION(BlueprintCallable, BlueprintPure, Category="VictoryBPLibrary", meta=(HidePin="WorldContextObject", DefaultToSelf="WorldContextObject" ) )
	static bool WorldType__InGameInstanceWorld(UObject* WorldContextObject);
	
	/** Cause a supplied Character (casted from Actor internally) to enter Ragdoll physics. A check will be done to see if the character has a physics asset. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Physics__EnterRagDoll(AActor* TheCharacter);
	
	/** Cause a supplied Character (casted from Actor internally) to exit Ragdoll physics. HeightAboveRBMesh is how far above the RB Mesh the Actor Capsule should be moved to upon exiting. Pass in the InitLocation and InitRotation from InitializeVictoryRagdoll */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Physics__LeaveRagDoll(AActor* TheCharacter,float HeightAboveRBMesh=64,const FVector& InitLocation=FVector(0,0,0), const FRotator& InitRotation=FRotator(0,0,0));

	/** Returns whether or not a supplied Character is in Ragdoll Physics. Cast from Actor done internally for your convenience. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Physics__IsRagDoll(AActor* TheCharacter);
	
	/** Get the Ragdoll Position of the supplied actor, casted to Character internally. Returns false if operation could not occur. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Physics__GetLocationofRagDoll(AActor* TheCharacter,FVector& RagdollLocation);
	
	/** Initialize Victory Ragdoll Mode, by Obtaining the Default Relative Rotation and Location for this Character's Mesh. The Output Location and Rotation must be saved for use with LeaveRagdoll. Returns false if operation could not occur */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Physics__InitializeVictoryRagDoll(AActor* TheCharacter, FVector&InitLocation, FRotator&InitRotation);
	
	/** Update the TheCharacter's Capsule Location and Camera to the Current Location of the Ragdoll. InterpSpeed is how fast the camera keeps up with the moving ragdoll! HeightOffset is the height above the ragdoll that the camera should stay. Returns false if operation could not occur or if Mesh was not in ragdoll */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Physics__UpdateCharacterCameraToRagdollLocation(AActor* TheCharacter, float HeightOffset=128,float InterpSpeed=3);
	
	/** Get Name as String*/
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static FString Accessor__GetNameAsString(const UObject* TheObject);
	
	/** Get Socket Local Transform. Returns false if operation could not occur.*/
	//UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	//static bool Accessor__GetSocketLocalTransform(const USkeletalMeshComponent* Mesh, FTransform& LocalTransform, FName SocketName=FName("SocketName"));
	
	/** Get Player Character's Player Controller. Requires: The Passed in Actor must be a character and it must be a player controlled character. IsValid will tell you if the return value is valid, make sure to do a Branch to confirm this! */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static APlayerController* Accessor__GetPlayerController(AActor* TheCharacter, bool&IsValid);
	
	/** SET the Mouse Position! Returns false if the operation could not occur */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Viewport__SetMousePosition(const APlayerController* ThePC, const float& PosX, const float& PosY);
	
	/** Get the Cursor Position within the Player's Viewport. This will return a result consistent with SET Mouse Position Returns false if the operation could not occur */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Viewport__GetMousePosition(const APlayerController* ThePC, float& PosX, float& PosY);
	
	/** Get the coordinates of the center of the player's screen / viewport. Returns false if the operation could not occur */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Viewport__GetCenterOfViewport(const APlayerController* ThePC, float& PosX, float& PosY);
	
	
	
	/** Convert Rotator to Vector */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static FRotator Conversions__VectorToRotator(const FVector& TheVector);
	
	/** Convert Vector to Rotator*/
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static FVector Conversions__RotatorToVector(const FRotator& TheRotator);
	
	/** Input Actor is expected to be a ACharacter, conversion done internally for your convenience */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	FRotator Character__GetControllerRotation(AActor * TheCharacter);
	
	/** Draw 3D Line of Chosen Thickness From Socket on Character's Mesh to Destination, conversion of AActor to ACharacter done internally for your convenience. Duration is in Seconds */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void Draw__Thick3DLineFromCharacterSocket(AActor* TheCharacter, const FVector& EndPoint, FName Socket=FName("SocketName"), FLinearColor LineColor=FLinearColor(1,0,0,1),  float Thickness=7, float Duration=-1.f);
	/** Draw 3D Line of Chosen Thickness From Mesh Socket to Destination. Duration is in Seconds */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void Draw__Thick3DLineFromSocket(USkeletalMeshComponent* Mesh, const FVector& EndPoint, FName Socket=FName("SocketName"), FLinearColor LineColor=FLinearColor(0,1,0,1), float Thickness=7, float Duration=-1.f);
	/** Draw 3D Line of Chosen Thickness Between Two Actors. Duration is in Seconds */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void Draw__Thick3DLineBetweenActors(AActor* StartActor, AActor* EndActor, FLinearColor LineColor=FLinearColor(0,0,1,1), float Thickness=7, float Duration=-1.f);
	
	/** AnimBPOwner - Must be a Character, Conversion Internally For Convenience.\n\nRetrieves the Aim Offsets Pitch & Yaw Based On the Rotation of the Controller of The Character Owning The Anim Instance.\n\nThe Pitch and Yaw are meant to be used with a Blend Space going from -90,-90 to 90,90.\n   Returns true if function filled the pitch and yaw vars successfully */
	UFUNCTION(BlueprintCallable, Category="VictoryBPLibrary")
	static bool Animation__GetAimOffsets(AActor* AnimBPOwner, float& Pitch, float& Yaw);
	
	/** AnimBPOwner - Must be a Character, Conversion Internally For Convenience.\n\nRetrieves the Aim Offsets Pitch & Yaw for the AnimBPOwner Based On the supplied Rotation.\n\nThe Pitch and Yaw are meant to be used with a Blend Space going from -90,-90 to 90,90.\n    Returns true if function filled the pitch and yaw vars successfully */
	UFUNCTION(BlueprintCallable, Category="VictoryBPLibrary")
	static bool Animation__GetAimOffsetsFromRotation(AActor * AnimBPOwner, const FRotator & TheRotation, float & Pitch, float & Yaw);
	
	/** Saves text to filename of your choosing, make sure include whichever file extension you want in the filename, ex: SelfNotes.txt . Make sure to include the entire file path in the save directory, ex: C:\MyGameDir\BPSavedTextFiles */
	UFUNCTION(BlueprintCallable, Category="VictoryBPLibrary")
	static bool FileIO__SaveStringTextToFile(FString SaveDirectory, FString JoyfulFileName, FString SaveText, bool AllowOverWriting = false);
	
	/** Obtain an Array of Actors Rendered Recently. You can specifiy what qualifies as "Recent" in seconds. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void Visibility__GetRenderedActors(TArray<AActor*>& CurrentlyRenderedActors, float MinRecentTime=0.01);
	
	/** Obtain an Array of Actors NOT Rendered Recently! You can specifiy what qualifies as "Recent" in seconds. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void Visibility__GetNotRenderedActors(TArray<AActor*>& CurrentlyNotRenderedActors, float MinRecentTime=0.01);
	
	/** Is the Current Game Window the Foreground window in the OS, or in the Editor? This will be accurate in standalone running of the game as well as in the editor PIE */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool ClientWindow__GameWindowIsForeGroundInOS();
	
	/** Freeze Game Render, Does Not Stop Game Logic, Just Rendering. This is not like Pausing. Mainly useful for freezing render when window is not in the foreground */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void Rendering__FreezeGameRendering();
	
	/** Unfreeze Game Render. This is not an unpause function, it's just for actual screen rendering */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void Rendering__UnFreezeGameRendering();
	
	/** Compare Source Vector against Array of Vectors. Returns: Returns the Closest Vector to Source and what that closest Distance is, or -1 if there was an error such as array being empty. Ignores: Ignores Source if source is in the array */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static float Calcs__ClosestPointToSourcePoint(const FVector & Source, const TArray<FVector>& OtherPoints, FVector& ClosestPoint);
	
	/** Takes in an actor (for convenience) and tries to cast it to Character and return an array of Vectors of all of the current bone locations of the character's Mesh. Locations are in World Space. Returns: false if the operation could not occur. Requires: Character Mesh Component must be valid */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Data__GetCharacterBoneLocations(AActor * TheCharacter, TArray<FVector>& BoneLocations);
	
	/** Retrieves the "Mesh" component of a Character. IsValid lets you know if the data is valid, make sure to check if it is! Requires: the passed in Actor must be a Character */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static USkeletalMeshComponent* Accessor__GetCharacterSkeletalMesh(AActor* TheCharacter, bool& IsValid);
	
	/** Does Not Do A Trace, But Obtains the Start and End for doing a Trace:\n\nTakes in an actor (for convenience) and tries to cast it to Character. Takes in a socket name to find on the Character's Mesh component, the socket location will be the start of the trace.\n\nAlso takes in the Angle / Rotator and the length of the trace you want to do. Option to draw the trace with variable thickness as it occurs.\n\nReturns what the Trace Start and End should be so you can plug these into any existing trace node you want.\n\nRequires: Character Mesh Component must be valid. Returns False if trace could not be done */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool TraceData__GetTraceDataFromCharacterSocket( FVector& TraceStart, FVector& TraceEnd, AActor * TheCharacter, const FRotator& TraceRotation, float TraceLength=10240, FName Socket="SocketName", bool DrawTraceData=true, FLinearColor TraceDataColor=FLinearColor(1,0,0,1), float TraceDataThickness=7);
	
	/** Does Not Do A Trace, But Obtains the Start and End for doing a Trace:\n\nTakes in a Skeletal Mesh Component and a socket name to trace from. Also takes in the Angle / Rotator and the length of the trace you want to do.\n\nOption to draw the trace as a variable thickness line\n\nReturns what the Trace Start and End should be so you can plug these into any existing trace node you want.\n\n Requires: Mesh must be valid. Returns False if trace could not be done */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool TraceData__GetTraceDataFromSkeletalMeshSocket(FVector& TraceStart, FVector& TraceEnd, USkeletalMeshComponent* Mesh, const FRotator& TraceRotation, float TraceLength=10240, FName Socket="SocketName", bool DrawTraceData=true, FLinearColor TraceDataColor=FLinearColor(1,0,0,1), float TraceDataThickness=7);
	
	/** Does a simple line trace given Trace Start and End, and if a Character is hit by the trace, then a component trace is performed on that character's mesh. Trace Owner is ignored when doing the trace.\n\nReturns the Character that was hit, as an Actor, as well as the name of the bone that was closest to the impact point of the trace. Also returns the impact point itself as well as the impact normal.\n\nUsing component trace ensures accuracy for testing against bones and sockets.\n\nIsValid: Will be true only if the component trace also hit someting. But the Returned Actor will contain an actor if any actor at all was hit by the simple trace. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static AActor* Traces__CharacterMeshTrace___ClosestBone(AActor* TraceOwner, const FVector& TraceStart, const FVector& TraceEnd, FVector& OutImpactPoint, FVector& OutImpactNormal, FName& ClosestBoneName,FVector & ClosestBoneLocation, bool&IsValid);
	
	/** Does a simple line trace given Trace Start and End, and if a Character is hit by the trace, then a component trace is performed on that character's mesh. Returns the name of the socket that was closest to the impact point of the trace. Also returns the impact point itself as well as the impact normal. Also returns the Socket Location. Using component trace ensures accuracy for testing against bones and sockets.*/
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static AActor* Traces__CharacterMeshTrace___ClosestSocket(const AActor * TraceOwner, const FVector& TraceStart, const FVector& TraceEnd, FVector& OutImpactPoint, FVector& OutImpactNormal, FName& ClosestSocketName,FVector & SocketLocation,bool&IsValid);
	
	/** Returns the float as a String with Precision, Precision 0 = no decimal value. Precison 1 = 1 decimal place. The re-precisioned result is rounded appropriately. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static void StringConversion__GetFloatAsStringWithPrecision(float TheFloat, FString & TheString, uint8 Precision=2);
	
	/** Rotator out value is the degrees of difference between the player camera and the direction of player to light source. Returns false if the operation could not occur. */
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool LensFlare__GetLensFlareOffsets(APlayerController* PlayerController,AActor* LightSource, float& PitchOffset, float& YawOffset, float& RollOffset);
	
	//~~~~~~~~~~~~~
	
	/** Returns false if the operation could not occur. */
	//UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	//static bool AnimatedVertex__GetAnimatedVertexLocations(USkeletalMeshComponent* Mesh, TArray<FVector>& Locations );
	
	/** Returns false if the operation could not occur. */
	//UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	//static bool AnimatedVertex__GetAnimatedVertexLocationsAndNormals(USkeletalMeshComponent* Mesh, TArray<FVector>& Locations, TArray<FVector>& Normals );
	
	/** 0 never skip, 0.5 = 50% chance to skip, 1 = skip all. Returns false if the operation could not occur. */
	//UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary", meta=(HidePin="WorldContextObject", DefaultToSelf="WorldContextObject" ))
	//static bool AnimatedVertex__DrawAnimatedVertexLocations(UObject* WorldContextObject, USkeletalMeshComponent* Mesh, float ChanceToSkipAVertex=0.777, bool DrawNormals=false);
	
	//~~~~~~~~~~~~~
	
	/** Returns false if the operation could not occur. */
	//UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary", meta=(DefaultToSelf="TheCharacter"))
	//static bool AnimatedVertex__GetCharacterAnimatedVertexLocations(AActor* TheCharacter, TArray<FVector>& Locations );
	
	/** Returns false if the operation could not occur. */
	//UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary", meta=(DefaultToSelf="TheCharacter"))
	//static bool AnimatedVertex__GetCharacterAnimatedVertexLocationsAndNormals(AActor* TheCharacter, TArray<FVector>& Locations, TArray<FVector>& Normals );
	
	/** 0 never skip, 0.5 = 50% chance to skip, 1 = skip all.. Returns false if the operation could not occur. */
	//UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	//static bool AnimatedVertex__DrawCharacterAnimatedVertexLocations(AActor* TheCharacter, float ChanceToSkipAVertex=0.777, bool DrawNormals=false);
	
	/** Retrieve Distance of given point to any Surface point on a Static Mesh Actor. Returns the distance as well as the exact closest point on the mesh surface to the given point. Returns -1 if an error occurred*/
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static float DistanceToSurface__DistaceOfPointToMeshSurface(AStaticMeshActor* TheSMA, const FVector& TestPoint, FVector& ClosestSurfacePoint);
	
	/** Change the Mobility of a Static Mesh Component, can be used in Constructor Script or in Event Graph! Returns false if operation could not occur.*/
	UFUNCTION(BlueprintCallable, Category = "VictoryBPLibrary")
	static bool Mobility__SetSceneCompMobility(USceneComponent* SceneComp, EComponentMobility::Type NewMobility);
};

