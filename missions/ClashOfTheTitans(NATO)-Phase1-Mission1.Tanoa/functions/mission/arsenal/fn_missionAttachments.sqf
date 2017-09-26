DK_fnc_missionWeaponRailAttachments = {
	params[["_railCategories", ["FLASH", "LASER"]]];

	_rails = [];

	// Flashlights
	_flash = ["FLASH", []];
	_flashes = [];
	_flashes pushBack "rhs_acc_2dpZenit";
	_flashes pushBack "rhs_acc_2dpZenit_ris";
	_flashes pushBack "rhsusf_acc_M952V";
	_flash set [1, _flashes];
	_rails pushBack _flash;

	// Flashlights
	_laser = ["LASER", []];
	_lasers = [];
	_lasers pushBack "rhs_acc_perst1ik";
	_lasers pushBack "rhs_acc_perst1ik_ris";
	_lasers pushBack "rhs_acc_perst3";
	_lasers pushBack "rhsusf_acc_anpeq15side_bk";
	_laser set [1, _lasers];
	_rails pushBack _laser;

	// Filter out Request Weapon Set
	_finalRails = [];
	{ 
		_catName = _x select 0;
		if(_catName in _railCategories) then {
			_finalRails = _finalRails + (_x select 1);
		};
	} forEach _rails;

	_finalRails;
};

DK_fnc_missionWeaponSights = {
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
};

DK_fnc_missionWeaponMuzzleAttachments = {
	params[["_muzzleCategories", ["BREAKS"]]];

	_muzzles = [];

	// Silencers
	_silence = ["SILENCER", []];
	_silences = [];
	_silences pushBack "rhs_acc_dtk4screws";
	_silences pushBack "rhs_acc_dtk4long";
	_silences pushBack "rhs_acc_tgpa";
	_silences pushBack "CUP_muzzle_PBS4";
	_silences pushBack "muzzle_snds_m_khk_F";
	_silences pushBack "muzzle_snds_B_khk_F";
	_silences pushBack "muzzle_snds_58_ghex_F";
	_silences pushBack "VME_LR4_Silencer";
	_silences pushBack "VME_QBZ95_1_Silencer";
	_silences pushBack "CUP_muzzle_snds_L85";
	_silences pushBack "CUP_muzzle_snds_M110";
	_silences pushBack "CUP_muzzle_snds_M14";
	_silences pushBack "CUP_muzzle_snds_M16_camo";
	_silences pushBack "rhsusf_acc_nt4_black";
	_silences pushBack "rhsusf_acc_M2010S";
	_silences pushBack "muzzle_snds_H_MG_khk_F";
	_silence set [1, _silences];
	_muzzles pushBack _silence;

	// Muzzle Breaks
	_break = ["BREAKS", []];
	_breaks = [];
	_breaks pushBack "rhs_acc_dtk3";
	_breaks pushBack "rhs_acc_dtk1";
	_breaks pushBack "rhs_acc_pgs64";
	_breaks pushBack "CUP_acc_sffh";
	_breaks pushBack "rhsusf_acc_SFMB556";
	_breaks pushBack "rhsusf_acc_ARDEC_M240";
	_break set [1, _breaks];
	_muzzles pushBack _break;

	_finalMuzzles = [];
	{ 
		_catName = _x select 0;
		if(_catName in _muzzleCategories) then {
			_finalMuzzles = _finalMuzzles + (_x select 1);
		};
	} forEach _muzzles;

	_finalMuzzles;
};

DK_fnc_loadWeaponAttachments = {
	params[["_sightSet", []], ["_railSet", []], ["_muzzleSet", []], ["_bipodSet", []]];
	_sightAttachments = [_sightSet] call DK_fnc_missionWeaponSights;
	_railAttachments = [_railSet] call DK_fnc_missionWeaponRailAttachments;
	_muzzleAttachments = [_muzzleSet] call DK_fnc_missionWeaponMuzzleAttachments;
	//_bipodAttachments = [_bipodSet]; //call DK_fnc_missionWeaponBipods;
	_attachments = _sightAttachments + _railAttachments + _muzzleAttachments + _bipodAttachments;
	_attachments;
};