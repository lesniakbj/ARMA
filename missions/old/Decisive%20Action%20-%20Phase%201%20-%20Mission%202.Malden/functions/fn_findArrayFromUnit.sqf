_unit = _this select 0;

_index = (sideObjUnits select 0) find (_unit);
if(_index != -1) exitWith  {
	(sideObjUnits select 0);
};

_index = (sideObjUnits select 1) find (_unit);
if(_index != -1) exitWith  {
	(sideObjUnits select 1);
};

_index = (mainObjUnits select 1) find (_unit);
if(_index != -1) exitWith  {
	(mainObjUnits select 1);
};