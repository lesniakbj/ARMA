params["_group", "_chanceDeathLow", "_chanceDeathHigh"];
_chance = _chanceDeathLow + (random (_chanceDeathHigh - _chanceDeathLow));

{
	if(_x != (leader _group)) then {
		_roll = random 100;
		if(_roll < _chance) then {
			deleteVehicle _x;
		};
	};
} forEach (units _group);
