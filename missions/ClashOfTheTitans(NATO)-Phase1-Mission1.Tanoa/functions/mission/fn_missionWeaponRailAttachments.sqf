params[["_lightCategories", ["FLASH", "LASER"]]];

_lights = [];

// Flashlights
_flash = ["FLASH", []];
_flashes = [];
_flashes pushBack "rhs_acc_2dpZenit";
_flashes pushBack "rhs_acc_2dpZenit_ris";
_flashes pushBack "rhsusf_acc_M952V";
_flash set [1, _flashes];
_lights pushBack _flash;

// Flashlights
_laser = ["LASER", []];
_lasers = [];
_lasers pushBack "rhs_acc_perst1ik";
_lasers pushBack "rhs_acc_perst1ik_ris";
_lasers pushBack "rhs_acc_perst3";
_lasers pushBack "rhsusf_acc_anpeq15side_bk";
_laser set [1, _lasers];
_lights pushBack _laser;

// Filter out Request Weapon Set
_finalLights = [];
{ 
	_catName = _x select 0;
	if(_catName in _lightCategories) then {
		_finalLights = _finalLights + (_x select 1);
	};
} forEach _lights;

_finalLights;