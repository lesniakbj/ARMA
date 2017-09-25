params[["_weaponCategories", ["PISTOL", "REVOLVER"]]];

_weps = [];

// Pistols
_pistol = ["PISTOL", []];
_pistols = [];
_pistols pushBack "hgun_ACPC2_F";
_pistols pushBack "CUP_hgun_Phantom";
_pistols pushBack "CUP_hgun_Glock17_blk";
_pistols pushBack "rhsusf_weap_m1911a1";
_pistols pushBack "rhsusf_weap_m9";
_pistols pushBack "CUP_hgun_Makarov";
_pistols pushBack "vme_pla_qsz92";
_pistol set [1, _pistols];
_weps pushBack _pistol;

// Revolvers
_revolver = ["REVOLVER", []];
_revolvers = [];
_revolvers pushBack "hgun_Pistol_heavy_02_F";
_revolvers pushBack "CUP_hgun_TaurusTracker455";
_revolver set [1, _revolvers];
_weps pushBack _revolver;

// SMGs
_smg = ["SMG", []];
_smgs = [];
_smgs pushBack "CUP_hgun_MicroUzi";
_smgs pushBack "rhs_weap_pp2000_folded";
_smgs pushBack "CUP_hgun_SA61";
_smg set [1, _smgs];
_weps pushBack _smg;

// Special
_special = ["SPECIAL", []];
_specials = [];
_specials pushBack "rhs_weap_M320";
_specials pushBack "rhs_weap_rsp30_white";
_specials pushBack "rhs_weap_rsp30_green";
_specials pushBack "rhs_weap_rsp30_red";
_special set [1, _specials];
_weps pushBack _special;

// Filter out Request Weapon Set
_finalWeps = [];
{ 
	_catName = _x select 0;
	if(_catName in _weaponCategories) then {
		_finalWeps = _finalWeps + (_x select 1);
	};
} forEach _weps;

_finalWeps;