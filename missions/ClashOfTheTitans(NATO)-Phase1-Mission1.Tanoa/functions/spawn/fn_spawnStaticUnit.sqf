params["_unit", ["_staticAnimation", "STAND"], ["_behaviour", "SAFE"], ["_stance", "UP"], ["_startDead", false], ["_canBreakFree", true]];
private _staticAnim = objNull;
if(!isServer) exitWith {};

_unit setBehaviour _behaviour;
_unit setUnitPos _stance;
	
if(_staticAnimation != "") then {
	if(side _unit == civilian) then {
		_staticAnim = [[_unit, _staticAnimation, "ASIS"], BIS_fnc_ambientAnim];
		if(_canBreakFree) then {
			_unit addEventHandler ["FiredNear", {
				params["_unit", "_vehicle", "_distance"];
				_unit setVariable ["DK_BreakStatic", true];
			}];
			[_unit] spawn DK_fnc_breakStaticCheck;
		};
	} else {
		_staticAnim = [[_unit, _staticAnimation, "ASIS"], BIS_fnc_ambientAnimCombat];
	};
	_staticAnim remoteExec ["call"];
};
	
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