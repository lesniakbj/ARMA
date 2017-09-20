params["_group", "_strengthRange", "_chanceRange"];
if(!isServer) exitWith {};

_chance = _chanceRange call DK_fnc_randomBetween;
_strength = floor (_strengthRange call DK_fnc_randomBetween);

for "_x" from 0 to _strength do {
	_shouldAdd = (random 100) <= _chance;
	if(_shouldAdd) then {
		_unitType = typeOf ([_group, true] call DK_fnc_randomUnitInGroup);
		_group createUnit [_unitType, (getPos (leader _group)), [], 0, "FORM"];
	};
};

_strength;
