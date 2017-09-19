// TODO: Wake up the entire group, not just the unit.
//		   Remove Group when All Awake
params["_groups"];
if(isServer) then {
	_allGroupsAwake = false;
	while {!_allGroupsAwake} do {
		_group = objNull;
		_units = objNull;
		for "_g" from 0 to ((count _groups) - 1) do {
			_group = _groups select _g;
			_units = (units _group);
			
			for "_u" from 0 to ((count _units) - 1) do {
				_unit = _units select _u;
				// Has Detected needs to be removed on civs.
				_hasDetected = _unit call BIS_fnc_enemyDetected;
				_canBreakFree = _unit getVariable ["CanBreakFree", false];
				_shouldStop = _unit getVariable ["StopStaticCheck", false];			
				
				for "_p" from 0 to ((count allPlayers) - 1) do {
					_player = allPlayers select _p;
					
					if(_canBreakFree && _hasDetected && !_shouldStop) exitWith {
						_unit call BIS_fnc_ambientAnim__terminate;
						_unit enableAI "PATH";
						_unit enableAI "MOVE";
						_unit setBehaviour "SAFE";
						_unit setVariable ["StopStaticCheck", true];
					};
				};
			};
		};
		sleep .5;
	};
}