// Get our Weapons Sets
_mizPrimayWeapons = [] call DK_fnc_missionPrimaryWeapons;
_mizSecondayWeapons = [["PISTOL", "SPECIAL"]] call DK_fnc_missionSecondaryWeapons;
_mizLaunchers = [["ROCKET", "AP-ROCKET"]] call DK_fnc_missionLauncherWeapons;
_weapons = _mizPrimayWeapons + _mizSecondayWeapons + _mizLaunchers;

// Get our Ammo Set
_ammo = [];
{ _wepAmmo = getArray (configfile >> "CfgWeapons" >> _x >> "magazines"); _ammo = _ammo + _wepAmmo; } forEach _weapons;

// Get our Weapon Attachments
_sightAttachments = [] call DK_fnc_missionWeaponSights;
_railAttachments = [] call DK_fnc_missionWeaponRailAttachments;
_muzzleAttachments = [["SILENCER"]] call DK_fnc_missionWeaponMuzzleAttachments;
_bipodAttachments = []; //call DK_fnc_missionWeaponBipods;
_attachments = _sightAttachments + _railAttachments + _muzzleAttachments + _bipodAttachments;

// Init and Add it all
["AmmoboxInit", [Arsenal1, false]] spawn BIS_fnc_arsenal;
["AmmoboxInit", [Arsenal2, false]] spawn BIS_fnc_arsenal;
[Arsenal1, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;
[Arsenal2, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;
[Arsenal1, _ammo, true] call BIS_fnc_addVirtualMagazineCargo;
[Arsenal2, _ammo, true] call BIS_fnc_addVirtualMagazineCargo;
[Arsenal1, _attachments, true] call BIS_fnc_addVirtualItemCargo;
[Arsenal2, _attachments, true] call BIS_fnc_addVirtualItemCargo;

// [Arsenal1, ["FirstAidKit","DemoCharge_Remote_Mag","CUP_H_CDF_H_PASGT_MNT","CUP_V_CDF_6B3_2_MNT","CUP_optic_Kobra","CUP_muzzle_PBS4","CUP_V_B_RRV_Scout3","CUP_H_FR_BeanieGreen","CUP_muzzle_snds_M16","CUP_V_B_RRV_Scout2","CUP_H_FR_BoonieMARPAT","CUP_V_CDF_6B3_3_MNT","CUP_V_CDF_6B3_1_MNT","CUP_B_FR_MOLLE_Sab","CUP_V_B_RRV_DA1","CUP_H_FR_ECH"], true] call BIS_fnc_addVirtualItemCargo;
// [Arsenal1, ["CUP_B_USMC_MOLLE_WDL","CUP_B_FR_MOLLE_Sab","CUP_B_CDF_MGPack"], true] call BIS_fnc_addVirtualBackpackCargo;