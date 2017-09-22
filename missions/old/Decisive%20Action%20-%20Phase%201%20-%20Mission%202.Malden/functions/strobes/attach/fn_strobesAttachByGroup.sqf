params["_group", "_delay"];
{ [_x, _delay] execVM "functions\strobes\attach\fn_strobesAttachByUnit.sqf"; } forEach (units _group);