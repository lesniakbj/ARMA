params["_unit", ["_behaviour", "COMBAT"], ["_animHandle", objNull], ["_transAnim", "AmovPercMstpSrasWrflDnon"]];
if(!isServer) exitWith {};

_unitPos = unitPos _unit;

// Remove the AI handcuffs
{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET", "PATH"];
_unit setBehaviour _behaviour;
_unit setUnitPos "UP";
detach _unit;

// Unlock the unit from it's ambient animation
_unit removeEventHandler ["AnimDone", _animHandle];
if(side _unit == civilian) then {
	_transAnim = "AmovPercMstpSnonWnonDnon";
};
_unit playMoveNow _transAnim;

sleep ((random 3) + 3);
// Return to the default or previously set unit pos
_unit setUnitPos _unitPos;

if(side _unit == civilian) then {
	(group _unit) allowFleeing 1;
};