params["_buildings", "_triggerZone"];
private _trgArea = triggerArea _triggerZone;
private _trgA = (_trgArea select 0);
private _trgB = (_trgArea select 1);
private  _remaining = [];
if(_partiallDestroyed) then {
	_remaining = [_buildings, _triggerZone] call DK_fnc_damageBuildings;
};

// Return Remaining
_remaining;