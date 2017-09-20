params ["_killed", "_killer", "_instigator"];
if (!isServer) exitWith {};
if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
if (isNull _instigator) then {_instigator = _killer};

if(isPlayer _killed) then {
	[_killed, _killer, _instigator] call DK_fnc_savePlayerDeath;
};

if(isPlayer _killer) then {
	[_killed, _killer, _instigator] call DK_fnc_savePlayerKill;
};
