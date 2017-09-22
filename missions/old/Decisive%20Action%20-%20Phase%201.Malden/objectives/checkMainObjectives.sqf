// Check for Group Strength (All should be 0)
_allGroupsDestroyed = true;
_groupsArr = mainObjUnits select 0;
_groupObjs = (count _groupsArr) - 1;
for "_y" from 0 to _groupObjs do
{
	_group = _groupsArr select _y;
	if(({alive _x} count units _group) != 0) exitWith {
		_allGroupsDestroyed = false;
	};
};

// Check for Radar Strength
_vehiclesArr = mainObjUnits select 1;
_vehiclesObjs = (count _vehiclesArr);
if(_vehiclesObjs != 0) then {
	_allGroupsDestroyed = false;
};

// Everything good? You win!
if(_allGroupsDestroyed) then {
	"end1" call BIS_fnc_endMission;
};