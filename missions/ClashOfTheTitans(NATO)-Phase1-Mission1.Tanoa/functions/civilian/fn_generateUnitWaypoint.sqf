params["_unit", "_triggerZone"];
if(!isServer) exitWith {};

while {true} do {
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
	_unit move _pos;
	waitUntil { 
		_unit distance _pos <= 10; 
	};
};