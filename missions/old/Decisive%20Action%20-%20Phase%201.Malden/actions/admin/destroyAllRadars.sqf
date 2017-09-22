_radarArr = mainObjUnits select 1;
_radarObjs = (count _radarArr) - 1;
for "_y" from 0 to _radarObjs do
{
	_radar = _radarArr select _y;
	"Bo_GBU12_LGB" createVehicle getPos _radar;
};

_groupArr = mainObjUnits select 0;
_groupCount = (count _groupArr) - 1;
for "_x" from 0 to _groupCount do
{
	_unitArr = units(_groupArr select _x);
	_unitCount = (count _unitArr) - 1;
	for "_z" from 0 to _unitCount do
	{
		_unit = _unitArr select _z;
		"Bo_GBU12_LGB" createVehicle getPos _unit;
	};
};