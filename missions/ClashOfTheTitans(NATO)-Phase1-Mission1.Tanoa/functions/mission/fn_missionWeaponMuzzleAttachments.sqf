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