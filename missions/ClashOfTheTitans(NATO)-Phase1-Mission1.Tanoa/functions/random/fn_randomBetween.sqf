params["_randLow", "_randHigh"];
if(!isServer) exitWith {};
private _value = _randLow + (random (_randHigh - _randLow));
_value;