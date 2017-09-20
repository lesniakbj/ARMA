params["_randLow", "_randHigh"];
if(!isServer) exitWith {};

_value = _randLow + (random (_randHigh - _randLow));
_value;