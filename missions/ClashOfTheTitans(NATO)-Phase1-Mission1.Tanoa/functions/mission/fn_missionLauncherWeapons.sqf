params[["_weaponCategories", ["AT-NT"]]];

_weps = [];

// AT (No Tracking)
_atnt = ["AT-NT", []];
_atnts = [];
_atnts pushBack "rhs_weap_M136";
_atnts pushBack "rhs_weap_m72a7";
_atnts pushBack "rhs_weap_smaw";
_atnts pushBack "vme_pla_PF89B";
_atnts pushBack "vme_pla_PF98";
_atnts pushBack "rhs_weap_rpg7";
_atnt set [1, _atnts];
_weps pushBack _atnt;

// AT (Tracking)
_att = ["AT-T", []];
_atts = [];
_atts pushBack "rhs_weap_fgm148";
_atts pushBack "launch_B_Titan_short_tna_F";
_att set [1, _atts];
_weps pushBack _att;

// AP
_ap = ["AP", []];
_aps = [];
_aps pushBack "rhs_weap_M136_hedp";
_aps pushBack "vme_pla_PF89A";
_aps pushBack "vme_pla_WPF89_2";
_aps pushBack "rhs_weap_rshg2";
_ap set [1, _aps];
_weps pushBack _ap;

// AA
_aa = ["AA", []];
_aas = [];
_aas pushBack "rhs_weap_igla";
_aas pushBack "rhs_weap_fim92";
_aa set [1, _aas];
_weps pushBack _aa;


// Anti-building
_ab = ["AB", []];
_abs = [];
_abs pushBack "rhs_weap_M136_hp";
_abs pushBack "vme_pla_PF89A_AST";
_ab set [1, _abs];
_weps pushBack _ab;

// Filter out Request Weapon Set
_finalWeps = [];
{ 
	_catName = _x select 0;
	if(_catName in _weaponCategories) then {
		_finalWeps = _finalWeps + (_x select 1);
	};
} forEach _weps;

_finalWeps;