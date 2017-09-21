/*
	Author: 
		Doctork Kamikaze

	Description:
		Ambient Civilian Life Zone

	Parameter(s):
		0: TRIGGER - Trigger Zone in which to Spawn Civilians
		1: ARRAY - [MinCivNum, MaxCivNum]
		2: STRING - Behaviour of the Spawned Civilians
		3: BOOLEAN - Should the City Zone start Partially Destroyed?
		4: BOOLEAN - Should the Generator create Civilian Static Pieces?
		5: BOOLEAN - Should the Generator create OpFor Static Pieces?

	Returns:
		GROUP - The Civilian Group that was Created
 */
params["_triggerZone", ["_civRange", [8, 15]], ["_behavior", "SAFE"], ["_partiallDestroyed", false], ["_createCivStatic", false], ["_createOpForStatic", false]];
if(!isServer) exitWith {};

// Create the Standard Civilians in the Area
private _numCivs = _civRange call DK_fnc_randomBetween;
private _civClasses = [worldName] call DK_fnc_getCivilianClasses;
private _civGroup = [_numCivs, _civClasses, _behavior, _triggerZone] call DK_fnc_generateCivilianGroupInArea;

// If the area is "War-Torn", destroy some buildings.
private _buildings = [_triggerZone] call DK_fnc_searchAreaForBuildings;
if(_partiallDestroyed) then {
	_buildings = [_buildings, _triggerZone] call DK_fnc_damageBuildings;
};

// With the remaining buildings, move some spawns there.
_civGroup = [_civGroup, _buildings] call DK_fnc_generateBuildingSpawns;

// Create Set Pieces, we want support for Civ/OPFOR Statics
if(_createCivStatic || _createOpForStatic) then {

};

// Create Random "Scripted" Waypoints
[_civGroup, _triggerZone] call DK_fnc_generateRandomWaypoints;

// Return the CivGroup
_civGroup;
