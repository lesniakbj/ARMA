params["_unit", "_triggerZone"];
if(!isServer) exitWith {};

while {true} do {
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
	waitUntil { _unit move _pos };
	sleep 1;
};