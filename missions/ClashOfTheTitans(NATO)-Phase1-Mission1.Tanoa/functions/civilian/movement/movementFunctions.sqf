/*

*/
DK_fnc_waypointLoop = {
	params["_unit", "_triggerZone", "_buildings"];
	if(!isServer) exitWith {};

	while {true} do {
		_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
		_wpToBuilding = (random 1) <= .3;
		if(_wpToBuilding) then {
			_buildingsPos = (selectRandom _buildings) buildingPos -1;
			if((count _buildingsPos) != 0) then {
				_bPos = selectRandom _buildingsPos;
				_unit doMove _bPos;
			};
		} else {
			_unit doMove _pos;
		};
		sleep ([45, 75] call DK_fnc_randomBetween);
	};
};

/*

*/
DK_fnc_applyWaypointLoop = {
	params["_civGroup", "_triggerZone", "_buildings"];
	if(!isServer) exitWith {};
	{ [_x, _triggerZone, _buildings] spawn DK_fnc_waypointLoop; } forEach (units _civGroup);
};