// For the civilian population zone we will
// follow the following rules:
//		1) Spawn Civilians in the Trigger Zone
//		2) Spawn some of the Civilians in Buildings
//		3) Generate a Single Waypoint for All Civilians
//		4) If the waypoint is gone, it should generate another
//		5) There should be a cap to the number of Civilians	
params[
	"_triggerZone", 
	["_civRange", [8, 15]], 
	["_behavior", "SAFE"], 
	["_partiallDestroyed", false], 
	["_createSetPieces", false]
];
if(!isServer) exitWith {};

// Create the Standard Civilians in the Area
private _numCivs = _civRange call DK_fnc_randomBetween;
private _civClasses = [worldName] call DK_fnc_getCivilianClasses;
private _civGroup = [_numCivs, _civClasses, _behavior, _triggerZone] call DK_fnc_generateCivilianGroupInArea;

// If the area is "War-Torn", destroy some buildings.
private _buildings = if(_trgA > _trgB) then { nearestObjects [_triggerZone, ["Static"], _trgA]; } else { nearestObjects [_triggerZone, ["Static"], _trgB]; };
if(_partiallDestroyed) then {
	_buildings = [_buildings, _triggerZone] call DK_fnc_damageBuildingsInArea;
};

// With the remaining buildings, move some spawns there.
_civGroup = [_civGroup] call DK_fnc_generateBuildingSpawns;

// Create Random "Scripted" Waypoints

// Return the CivGroup
_civGroup;
