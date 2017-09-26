DK_fnc_missionPrimaryWeapons = {
	params[["_weaponCategories", ["M16"]]];

	_weps = [];

	// AK Variants
	_ak = ["AK", []];
	_aks = [];
	_aks pushBack "rhs_weap_ak103_2_npz";
	_aks pushBack "rhs_weap_ak103_gp25_npz";
	_aks pushBack "CUP_arifle_AK107";
	_aks pushBack "CUP_arifle_AK107_GL";
	_aks pushBack "CUP_arifle_AK47";
	_aks pushBack "rhs_weap_ak74m_2mag_camo";
	_aks pushBack "rhs_weap_ak74m_fullplum_gp25_npz";
	_aks pushBack "rhs_weap_aks74n_npz";
	_aks pushBack "rhs_weap_aks74n_gp25_npz";
	_aks pushBack "rhs_weap_m21a_pr";
	_aks pushBack "rhs_weap_m76";
	_aks pushBack "vme_pla_qbz03";
	_aks pushBack "CUP_arifle_Sa58RIS2";
	_ak set [1, _aks];
	_weps pushBack _ak;

	// M4 / M16 and Variants
	_m16 = ["M16", []];
	_m16s = [];
	_m16s pushBack "rhs_weap_hk416d145";
	_m16s pushBack "CUP_srifle_L129A1_HG";
	_m16s pushBack "rhs_weap_m16a4_pmag";
	_m16s pushBack "rhs_weap_m16a4_carryhandle_M203";
	_m16s pushBack "rhs_weap_m4_mstock";
	_m16s pushBack "rhs_weap_m4_m203";
	_m16s pushBack "CUP_arifle_M4A1_black";
	_m16s pushBack "rhs_weap_m4a1_blockII_wd";
	_m16s pushBack "rhs_weap_m4a1_blockII_M203_wd";
	_m16s pushBack "rhs_weap_mk18_wd";
	_m16s pushBack "rhs_weap_mk18_m320";
	_m16 set [1, _m16s];
	_weps pushBack _m16;

	// Sniper / Marksman Rifles
	_sniper = ["SNIPER", []];
	_snipers = [];
	_snipers pushBack "CUP_srifle_AWM_wdl";
	_snipers pushBack "rhs_weap_M107";
	_snipers pushBack "CUP_srifle_M110";
	_snipers pushBack "rhs_weap_m14ebrri";
	_snipers pushBack "rhs_weap_XM2010_wd";
	_snipers pushBack "rhs_weap_m24sws_ghillie";
	_snipers pushBack "rhs_weap_m40a5_wd";
	_snipers pushBack "rhs_weap_sr25_ec_wd";
	_snipers pushBack "srifle_EBR_F";
	_snipers pushBack "rhs_weap_m38_rail";
	_snipers pushBack "vme_pla_qbu88";
	_snipers pushBack "rhs_weap_svdp_wd_npz";
	_snipers pushBack "rhs_weap_t5000";
	_sniper set [1, _snipers];
	_weps pushBack _sniper;

	// LMG / MMG
	_lmg = ["LMG", []];
	_lmgs = [];
	_lmgs pushBack "CUP_lmg_minimi_railed";
	_lmgs pushBack "CUP_arifle_L86A2";
	_lmgs pushBack "rhs_weap_m240G";
	_lmgs pushBack "rhs_weap_m249_pip_L";
	_lmgs pushBack "rhs_weap_m27iar_grip";
	_lmgs pushBack "rhs_weap_pkm";
	_lmgs pushBack "CUP_lmg_Pecheneg";
	_lmgs pushBack "CUP_arifle_RPK74_45";
	_lmgs pushBack "CUP_arifle_RPK74";
	_lmg set [1, _lmgs];
	_weps pushBack _lmg;

	// Other Rifles
	_other = ["OTHER", []];
	_others = [];
	_others pushBack "CUP_arifle_CZ805_B";
	_others pushBack "CUP_arifle_CZ805_B_GL";
	_others pushBack "CUP_arifle_FNFAL_railed";
	_others pushBack "CUP_arifle_FNFAL_OSW";
	_others pushBack "CUP_arifle_G36C";
	_others pushBack "CUP_arifle_G36K";
	_others pushBack "CUP_arifle_L85A2";
	_others pushBack "CUP_arifle_L85A2_GL";
	_others pushBack "CUP_srifle_Mk12SPR";
	_others pushBack "CUP_arifle_Mk17_STD_woodland";
	_others pushBack "CUP_arifle_Mk17_STD_SFG_woodland";
	_others pushBack "vme_pla_qbz95_1";
	_others pushBack "vme_pla_qjb95_1";
	_others pushBack "CUP_arifle_XM8_Carbine_FG";
	_others pushBack "CUP_arifle_xm8_sharpshooter";
	_other set [1, _others];
	_weps pushBack _other;

	// SMGs
	_smg = ["SMG", []];
	_smgs = [];
	_smgs pushBack "CUP_smg_MP5A5";
	_smgs pushBack "CUP_smg_MP5SD6";
	_smgs pushBack "rhsusf_weap_MP7A2_aor1";
	_smgs pushBack "rhs_weap_vss_grip_npz";
	_smg set [1, _smgs];
	_weps pushBack _smg;

	// Shotguns
	_shotgun = ["SHOTGUN", []];
	_shotguns = [];
	_shotguns pushBack "CUP_sgun_M1014";
	_shotguns pushBack "rhs_weap_M590_8RD";
	_shotguns pushBack "CUP_sgun_Saiga12K";
	_shotgun set [1, _shotguns];
	_weps pushBack _shotgun;

	// Filter out Request Weapon Set
	_finalWeps = [];
	{ 
		_catName = _x select 0;
		if(_catName in _weaponCategories) then {
			_finalWeps = _finalWeps + (_x select 1);
		};
	} forEach _weps;

	_finalWeps;
};

DK_fnc_missionSecondaryWeapons = {
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
};

DK_fnc_missionLauncherWeapons = {
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
};

DK_fnc_loadMissionWeapons = {
	params[["_primarySet", []], ["_secondarySet", []], ["_launcherSet", []]];
	_weapons = [];
	_mizPrimayWeapons = [_primarySet] call DK_fnc_missionPrimaryWeapons;
	_mizSecondayWeapons = [_secondarySet] call DK_fnc_missionSecondaryWeapons;
	_mizLaunchers = [_launcherSet] call DK_fnc_missionLauncherWeapons;
	_weapons = _mizPrimayWeapons + _mizSecondayWeapons + _mizLaunchers;
	_weapons;
};