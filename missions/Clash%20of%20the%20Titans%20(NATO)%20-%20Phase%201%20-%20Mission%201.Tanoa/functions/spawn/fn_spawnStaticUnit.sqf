params["_unit", "_idleAnimation", "_behaviour", "_stance", "_kill", "_breakFree"];
if(isServer) then {
	_unit disableAI "PATH";
	
	if(_idleAnimation != "") then {
		[[_unit, _idleAnimation, "ASIS"], BIS_fnc_ambientAnim] remoteExec ["call"];
	};
	
	if(_behaviour != "") then {
		_unit setBehaviour _behaviour;
	};
	
	if(_stance != "") then {
		_unit setUnitPos _stance;
	};
	
	if(_kill) then {
		_rand = random 15;
		_unit setDir (random 360);
		_unit setVelocity [_rand, _rand, _rand];
		_unit setDamage 1;
	};
	
	if(_breakFree) then {
		_unit setVariable ["CanBreakFree", true];
	} else {
		_unit setVariable ["CanBreakFree", false];
	};
};