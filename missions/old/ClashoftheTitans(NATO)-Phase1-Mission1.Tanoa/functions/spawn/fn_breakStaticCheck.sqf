params["_unit", "_staticAnimation"];
if(!isServer) exitWith {};
private _animHandle = -1;

if(_staticAnimation != "DK_STATIC") then {
	waitUntil {
		sleep 0.1;
		_animHandle = _unit getVariable ["BIS_EhAnimDone", -1];
		(_animHandle > -1)
	};
};

diag_log "Waiting for behaviour to change...";
waitUntil {
	sleep 0.1;
	_broken = _unit getVariable ["DK_BreakStatic", false];
	_inCombat = (behaviour _unit == "COMBAT");
	_damaged = (damage _unit > 0);
	_enemyDetected = (_unit call BIS_fnc_enemyDetected);
	_playerClose = false;

	(_broken || _inCombat || _damaged || _enemyDetected || _playerClose);
};

diag_log "Making Unit Active...";
(group _unit) setBehaviour "COMBAT";
//_staticAnim = [[_unit], BIS_fnc_ambientAnim__terminate];
//_staticAnim remoteExec ["call"];
[_unit, "COMBAT", _animHandle] call DK_fnc_makeActiveUnit;