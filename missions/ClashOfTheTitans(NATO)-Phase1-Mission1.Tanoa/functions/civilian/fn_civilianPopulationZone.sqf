/*
	Author: 
		Doctork Kamikaze

	Description:
		Ambient Civilian Life Zone

	Parameter(s):
		0: TRIGGER - Trigger Zone in which to Spawn Civilians
		1: ARRAY - [MinCivNum, MaxCivNum], Range of Number of Civilians to Spawn - [8, 15]
		2: STRING - Behaviour of the Spawned Civilians - "SAFE"
		3: BOOLEAN - Should the City Zone start Partially Destroyed? - false
		4: BOOLEAN - Should the Generator create Civilian Static Pieces? - false
		5: BOOLEAN - Should the Generator create OpFor Static Pieces? - false

	Returns:
		GROUP - The Civilian Group that was Created
 */
params["_triggerZone", ["_civRange", [8, 15]], ["_behavior", "SAFE"], ["_destroyed", false], ["_civStatics", false], ["_opForStatic", false]];
if(!isServer) exitWith {};

// Create the Standard Civilians in the Area
private _numCivs = _civRange call DK_fnc_randomBetween;
private _civClasses = [worldName] call DK_fnc_getCivilianClasses;
private _civGroup = [_numCivs, _civClasses, _behavior, _triggerZone] call DK_fnc_generateCivilianGroupInArea;

// If the area is "War-Torn", destroy some buildings.
private _buildings = [_triggerZone] call DK_fnc_searchAreaForBuildings;
if(_destroyed) then {
	_buildings = [_buildings, _triggerZone] call DK_fnc_damageBuildings;
};

// With the remaining buildings, move some spawns there.
[_civGroup, _buildings] call DK_fnc_generateBuildingSpawns;

// Create Set Pieces, we want support for Civ/OPFOR Statics
if(_civStatics || _opForStatic) then {

};

// Create Random "Scripted" Waypoints
[_civGroup, _triggerZone, _buildings] call DK_fnc_generateCivilianWaypoints;

// Return the CivArr
_civGroup;
