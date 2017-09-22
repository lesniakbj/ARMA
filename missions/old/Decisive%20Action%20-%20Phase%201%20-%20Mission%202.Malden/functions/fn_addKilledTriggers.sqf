fn_findArrayFromUnit = compile preprocessFile "functions\fn_findArrayFromUnit.sqf";

// Funtion: Add Killed Triggers
// Params: Array of Objects, Array to Remove From
//
_objArr = _this select 0;
_objCount = (count _objArr) - 1;
for "_x" from 0 to _objCount do
{
	_obj = _objArr select _x;
	_obj addEventHandler ["Killed", {
		_objKilled = (_this select 0);
		_array = [_objKilled] call fn_findArrayFromUnit;
		[_array, _objKilled] execVM "functions\fn_removeFromArray.sqf"; 
	}];
};