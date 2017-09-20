params ["_killed", "_killer", "_instigator"];
if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
if (isNull _instigator) then {_instigator = _killer};

if(isPlayer _killed) then {
	// DK_cmp_Deaths = [Deaths, [Type, DeathsByType]];
	["DK_cmp_Deaths"] call DK_fnc_loadStat;
	private _deathsObj = DK_cmp_Deaths;
	private _killerType = roleDescription _killer;
	private _killersObjs = _deathsObj select 1;

	// Selects [Type, DeathsByType] where _role == _killerType, then Selects [Deaths, [T, DBT]] using [T, DBT];
	_matched = _deathsObj select {(_killersObjs select 0) isEqualTo _killerType} select 0;

	// Update the object to the new values
	_updated = [(_matched select 0) + 1, [_matched select 1, (_matched select 2) + 1]];

	// Update the saved var
	_deathsObj set [0, (_updated select 0)];
	_killersObjs set [(_killersObjs find _matched), (_updated select 1)];
	_deathsObj set [1, _killersObjs];
	["DK_cmp_Deaths", _deathsObj] call DK_fn_saveStat;
};

if(isPlayer _killer) then {
	// DK_cmp_Kills = [Kills, [Type, KillsByType]];
	["DK_cmp_Kills"] call DK_fnc_loadStat;
	private _killsObj = DK_cmp_Kills;
	private _killedType = roleDescription _killed;
	private _killedObjs = _killsObj select 1;
	_matched = _killsObj select {(_killersObjs select 0) isEqualTo _killerType} select 0;

	// Update the object to the new values
	_updated = [(_matched select 0) + 1, [_matched select 1, (_matched select 2) + 1]];

	// Update the saved var
	_killsObj set [0, (_updated select 0)];
	_killedObjs set [(_killedObjs find _matched), (_updated select 1)];
	_killsObj set [1, _killedObjs];
	["DK_cmp_Kills", _killsObj] call DK_fn_saveStat;
};
