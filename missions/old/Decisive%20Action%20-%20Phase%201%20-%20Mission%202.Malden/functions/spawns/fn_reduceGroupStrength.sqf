params["_group", "_chanceDeathLow", "_chanceDeathHigh", "_unitTypesToExclude"];
_chance = _chanceDeathLow + (random (_chanceDeathHigh - _chanceDeathLow));

{
	_exclude =  (_unitTypesToExclude find (typeOf _x) != -1);
	_isNotLeader = _x != (leader _group);
	if(_isNotLeader && !_exclude) then {
		_roll = random 100;
		if(_roll < _chance) then {
			deleteVehicle _x;
		};
	};
} forEach (units _group);
