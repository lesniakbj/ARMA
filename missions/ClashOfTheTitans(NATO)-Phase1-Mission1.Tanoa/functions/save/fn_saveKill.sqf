params ["_killed", "_killer", "_instigator"];
if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
if (isNull _instigator) then {_instigator = _killer};

// 
if(isPlayer _killed) then {
	["DK_cmp_Deaths"] call DK_fnc_loadStat;
	_deathsObj = [DK_cmp_Deaths, _killed, _killer] call DK_fnc_updateKills;
	["DK_cmp_Deaths", _deathsObj] call DK_fn_saveStat;
};

if(side _killed == civilian) then {
	["DK_cmp_CiviliansKilled"] call DK_fnc_loadStat;
	_civsKilledObj = [DK_cmp_CiviliansKilled, _killed, _killer] call DK_fnc_updateKills;
	["DK_cmp_CiviliansKilled", _civsKilledObj] call DK_fn_saveStat;
};

if(isPlayer _killer) then {
	["DK_cmp_Kills"] call DK_fnc_loadStat;
	_killsObj = [DK_cmp_Kills, _killed, _killer] call DK_fnc_updateKills;
	["DK_cmp_Kills", _killsObj] call DK_fn_saveStat;
};
