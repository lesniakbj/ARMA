params["_killCountArray", "_killed", "_killer"];
private _killsObj = _killCountArray;
private _killType = if(!(roleDescription _killed isEqualTo "")) then { roleDescription _killed; } else { getText (configFile/"cfgVehicles"/(typeOf _killed)/"displayName"); };
private _killsByTypeObjs = _killsObj select 1;
_matched = _killsObj select {(_killsByTypeObjs select 0) isEqualTo _killType} select 0;

// Update the object to the new values
_updated = [(_matched select 0) + 1, [_matched select 1, (_matched select 2) + 1]];

// Update the saved var
_killsObj set [0, (_updated select 0)];
_killsByTypeObjs set [(_killsByTypeObjs find _matched), (_updated select 1)];
_killsObj set [1, _killsByTypeObjs];
_killsObj;