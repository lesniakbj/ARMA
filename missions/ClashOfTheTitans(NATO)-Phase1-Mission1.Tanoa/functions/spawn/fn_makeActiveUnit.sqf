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

sleep ((random 1) + 2);
// Return to the default or previously set unit pos
_unit setUnitPos _unitPos;

if(side _unit != civilian) then {
	_nearest = _unit findNearestEnemy _unit;
	_unit doMove (getPos _nearest);
	_unit setBehaviour "COMBAT";
} else {
	_unit doMove (markerPos "BeginMarker");
};