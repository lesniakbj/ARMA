params["_group", "_excludeTL"];
if(!isServer) exitWith {};

if(!_excludeTL) exitWith {
	selectRandom (units _group);
};

_unit = (leader _group);
while{_unit == (leader _group)} do {
	_unit = selectRandom (units _group);
};

_unit;
