_SAMArr = sideObjUnits select 0;
_radarArr = sideObjUnits select 1;
_SAMCount = (count _SAMArr) - 1;
_radarObjs = (count _radarArr) - 1;

for "_z" from 0 to _SAMCount do
{
	_SAM = _SAMArr select _z;
	"Bo_GBU12_LGB" createVehicle getPos _SAM;
	
};

for "_y" from 0 to _radarObjs do
{
	_radar = _radarArr select _y;
	"Bo_GBU12_LGB" createVehicle getPos _radar;
};

_callingTL =  (_this select 1);
_actionID = (_this select 2);
_callingTL removeAction _actionID;