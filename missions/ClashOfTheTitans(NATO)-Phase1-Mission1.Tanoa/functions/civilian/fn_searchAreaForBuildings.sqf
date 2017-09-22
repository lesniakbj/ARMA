params["_triggerZone"];
if(!isServer) exitWith {};
private _trgArea = triggerArea _triggerZone;
private _trgA = (_trgArea select 0);
private _trgB = (_trgArea select 1);
private _types = ["Static"];
private _buildings = if(_trgA > _trgB) then { nearestObjects [_triggerZone, _types, _trgA]; } else { nearestObjects [_triggerZone, _types, _trgB]; };

// Return buildings
_buildings;