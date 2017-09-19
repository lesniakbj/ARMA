params["_randLow", "_randHigh"];
if(isServer) then {
	_value = _randLow + (random (_randHigh - _randLow));
	_value;
};