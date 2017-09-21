params["_unit", ["_staticAnimation", "STAND"], ["_behaviour", "SAFE"], ["_stance", "UP"], ["_startDead", false], ["_canBreakFree", true]];
if(!isServer) exitWith {};

// Set static animation, or make unit static. 
private _staticAnim = objNull;
if(_staticAnimation != "DK_STATIC") then {
	_staticAnim = [[_unit, _staticAnimation, "ASIS"], BIS_fnc_ambientAnim];
	_staticAnim remoteExec ["call"];
} else {
	_unit disableAI "PATH";	
};

// Set desired behaviour and stance
// _unit disableAI "PATH";
_unit setBehaviour _behaviour;
_unit setUnitPos _stance;
	
// If we start dead, give them some random velocity for ragdolls
if(_startDead) then {
	_zVel = random 15;
	_xNeg = (random 1 >= .50);
	_xVel = _zVel;
	if(_xNeg) then {
		_xVel = -_zVel;
	};

	_yNeg = (random 1 >= .50);
	_yVel = _zVel;
	if(_yNeg) then {
		_yVel = -_zVel;
	};

	_unit setDamage 1;
	_unit setVelocity [_xVel, _yVel, _zVel];
};

// If they can break free, add the event handlers and spawn condition checks
if(_canBreakFree) then {
	_unit addEventHandler ["FiredNear", {
		params["_unit", "_vehicle", "_distance"];
		[_unit, _vehicle, _distance, _thisEventHandler] call DK_fnc_breakStaticEventHandler;
	}];
	[_unit, _staticAnimation] spawn DK_fnc_breakStaticCheck;
};

_unit;