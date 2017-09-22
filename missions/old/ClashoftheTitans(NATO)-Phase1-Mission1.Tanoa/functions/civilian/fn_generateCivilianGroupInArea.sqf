params["_numCivs", "_civClasses", "_behavior", "_triggerZone"];
if(!isServer) exitWith {};
private _civGroup = grpNull;
for "_x" from 0 to _numCivs do {
	if(isNull _civGroup) then {
		_civGroup = createGroup civilian;
	};
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
	_civClass = selectRandom _civClasses;
	_civ = _civGroup createUnit [_civClass, _pos, [], 0, "NONE"];
	_civ setSpeedMode "LIMITED";
	_civ setCombatMode "GREEN";
	_civ setBehaviour _behavior;
	_civ enableDynamicSimulation true;
};

// Return the Civ Array
_civGroup;