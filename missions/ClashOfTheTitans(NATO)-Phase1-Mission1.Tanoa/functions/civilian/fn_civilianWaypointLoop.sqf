params["_unit", "_triggerZone", "_buildings"];
if(!isServer) exitWith {};

while {true} do {
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
	_wpToBuilding = (random 1) <= .3;
	if(_wpToBuilding) then {
		_pos = selectRandom ((selectRandom _buildings) buildingPos -1);
	};
	_unit doMove _pos;
	sleep ([45, 75] call DK_fnc_randomBetween);
};