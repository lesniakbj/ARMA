params["_unit", "_triggerZone"];
if(!isServer) exitWith {};

while {true} do {
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
	_unit doMove _pos;
	sleep 60;
};