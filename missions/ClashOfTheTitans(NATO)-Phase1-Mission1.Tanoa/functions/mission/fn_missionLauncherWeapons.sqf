params[["_weaponCategories", ["ROCKET"]]];

_weps = [];

// AT (No Tracking)
_rocket = ["ROCKET", []];
_rockets = [];
_rockets pushBack "rhs_weap_M136";
_rockets pushBack "rhs_weap_m72a7";
_rockets pushBack "rhs_weap_smaw";
_rockets pushBack "vme_pla_PF89B";
_rockets pushBack "vme_pla_PF98";
_rockets pushBack "rhs_weap_rpg7";
_rocket set [1, _rockets];
_weps pushBack _rocket;

// AT (Tracking)
_missile = ["MISSILE", []];
_missiles = [];
_missiles pushBack "rhs_weap_fgm148";
_missiles pushBack "launch_B_Titan_short_tna_F";
_missile set [1, _missiles];
_weps pushBack _missile;

// AP
_apRocket = ["AP-ROCKET", []];
_apRockets = [];
_apRockets pushBack "rhs_weap_M136_hedp";
_apRockets pushBack "vme_pla_PF89A";
_apRockets pushBack "vme_pla_WPF89_2";
_apRockets pushBack "rhs_weap_rshg2";
_apRocket set [1, _apRockets];
_weps pushBack _apRocket;

// AA
_aaMissile = ["AA-MISSILE", []];
_aaMissiles = [];
_aaMissiles pushBack "rhs_weap_igla";
_aaMissiles pushBack "rhs_weap_fim92";
_aaMissile set [1, _aaMissiles];
_weps pushBack _aaMissile;


// Anti-Structure
_asRocket = ["AB-ROCKET", []];
_asRockets = [];
_asRockets pushBack "rhs_weap_M136_hp";
_asRockets pushBack "vme_pla_PF89A_AST";
_asRocket set [1, _asRockets];
_weps pushBack _asRocket;

// Filter out Request Weapon Set
_finalWeps = [];
{ 
	_catName = _x select 0;
	if(_catName in _weaponCategories) then {
		_finalWeps = _finalWeps + (_x select 1);
	};
} forEach _weps;

_finalWeps;