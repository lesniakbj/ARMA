params[["_sightCategories", ["SHORT"]]];

_sights = [];

// Short Range Sights
_short = ["SHORT", []];
_shorts = [];
_shorts pushBack "rhs_acc_rakursPM";
_shorts pushBack "rhs_acc_1p63";
_shorts pushBack "rhs_acc_pkas";
_shorts pushBack "rhsusf_acc_EOTECH";
_shorts pushBack "rhsusf_acc_compm4";
_shorts pushBack "rhsusf_acc_SpecterDR_A";
_shorts pushBack "CUP_optic_CompM4";
_short set [1, _shorts];
_sights pushBack _short;

// Medium Range Sights
_medium = ["MEDIUM", []];
_mediums = [];
_mediums pushBack "VME_Eotech_557_Magnifier_DOWN";
_mediums pushBack "rhsusf_acc_ACOG_USMC";
_mediums pushBack "rhsusf_acc_ACOG_RMR";
_medium set [1, _mediums];
_sights pushBack _medium;

// Long Range Sights
_long = ["LONG", []];
_longs = [];
_longs pushBack "optic_LRPS_tna_F";
_longs pushBack "rhs_acc_dh520x56";
_longs pushBack "rhs_acc_pso1m21";
_longs pushBack "rhsusf_acc_M8541_low_wd";
_longs pushBack "rhsusf_acc_LEUPOLDMK4";
_long set [1, _longs];
_sights pushBack _long;

// NV Sights
_nv = ["NVS", []];
_nvs = [];
_nv set [1, _nvs];
_sights pushBack _nv;

// Filter out Request Weapon Set
_finalSights = [];
{ 
	_catName = _x select 0;
	if(_catName in _sightCategories) then {
		_finalSights = _finalSights + (_x select 1);
	};
} forEach _sights;

_finalSights;