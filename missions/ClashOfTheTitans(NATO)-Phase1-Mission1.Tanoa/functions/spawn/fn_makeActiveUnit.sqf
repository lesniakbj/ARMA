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

_grp = (group _unit);
if(side _unit == civilian) then {
	_grp allowFleeing 1;
	_grp setBehaviour "AWARE";
} else {
	_pos = _grp findNearestEnemy (getPos _unit);
	_grp move _pos;
	_grp setBehaviour "COMBAT";
};