params["_unit", ["_behaviour", "COMBAT"], ["_animHandle", objNull], ["_transAnim", "AmovPercMstpSrasWrflDnon"]];
if(!isServer) exitWith {};
private _unitPos = unitPos _unit;

// Remove the AI handcuffs
{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET", "PATH"];
_unit setBehaviour _behaviour;
_unit setUnitPos "UP";
_thing = attachedTo _unit;
detach _unit;
deleteVehicle _thing;


// Unlock the unit from it's ambient animation
_unit removeEventHandler ["AnimDone", _animHandle];
_unit playMoveNow _transAnim;

sleep ((random 3) + 3);
// Return to the default or previously set unit pos
_unit setUnitPos _unitPos;

if(side _unit == civilian) then {
	_grp = (group _unit);
	_grp allowFleeing 1;
	_wp = _grp addWaypoint [(getPos _unit), ([50, 100] call DK_fnc_randomBetween), 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "FULL";
	_grp setBehaviour "CARELESS";
} else {
	_grp = (group _unit);
	_wp = _grp addWaypoint [(getPos _unit),0, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointSpeed "FULL";
	_grp setBehaviour "CARELESS";
};