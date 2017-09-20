params["_unit", "_staticAnimation", ["_behaviour", "SAFE"], ["_stance", "UP"], ["_startDead", false], ["_canBreakFree", true]];
if(!isServer) exitWith {};

// Set Basic Behaviour
diag_log format["Setting Basic Behaviour.."];
_unit disableAI "PATH";
_unit setBehaviour _behaviour;
_unit setUnitPos _stance;

// Add Idle Animation
diag_log format["Adding Idle Animations.."];
if(_staticAnimation != "") then {
	_idleAnim = [];
	if(side _unit != civilian) then {
		_idleAnim = [[_unit, _staticAnimation, "ASIS"], BIS_fnc_ambientAnimCombat];
	} else {
		_idleAnim = [[_unit, _staticAnimation], BIS_fnc_ambientAnim];
	};
	diag_log format["IdleAnim: %1", str _idleAnim];
	_idleAnim remoteExec ["call"];
};

// Kill the Unit if Requested
diag_log format["Killing Static If Requested.."];
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

_unit;