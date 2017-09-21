params["_triggerZone"];
private _trgArea = triggerArea _triggerZone;
private _trgA = (_trgArea select 0);
private _trgB = (_trgArea select 1);
private _buildings = if(_trgA > _trgB) then { nearestObjects [_triggerZone, ["Static"], _trgA]; } else { nearestObjects [_triggerZone, ["Static"], _trgB]; };

// Return buildings
_buildings;