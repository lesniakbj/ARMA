// Init the Ammo Boxes
["AmmoboxInit", [Arsenal1, false]] spawn BIS_fnc_arsenal;
["AmmoboxInit", [Arsenal2, false]] spawn BIS_fnc_arsenal;

// Get our Weapon Sets
_mizPrimayWeapons = [] call DK_fnc_missionPrimaryWeapons;
_mizSecondayWeapons = [["PISTOL", "SPECIAL"]] call DK_fnc_missionSecondaryWeapons;
_mizLaunchers = [["AT-NT", "AP"]] call DK_fnc_missionLauncherWeapons;
_weapons = _mizPrimayWeapons + _mizSecondayWeapons + _mizLaunchers;
[Arsenal1, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;
[Arsenal2, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;

// Get our Item Sets

// [Arsenal1, ["FirstAidKit","DemoCharge_Remote_Mag","CUP_H_CDF_H_PASGT_MNT","CUP_V_CDF_6B3_2_MNT","CUP_optic_Kobra","CUP_muzzle_PBS4","CUP_V_B_RRV_Scout3","CUP_H_FR_BeanieGreen","CUP_muzzle_snds_M16","CUP_V_B_RRV_Scout2","CUP_H_FR_BoonieMARPAT","CUP_V_CDF_6B3_3_MNT","CUP_V_CDF_6B3_1_MNT","CUP_B_FR_MOLLE_Sab","CUP_V_B_RRV_DA1","CUP_H_FR_ECH"], true] call BIS_fnc_addVirtualItemCargo;
// [Arsenal1, ["CUP_B_USMC_MOLLE_WDL","CUP_B_FR_MOLLE_Sab","CUP_B_CDF_MGPack"], true] call BIS_fnc_addVirtualBackpackCargo;

// Get our Harness/Armor Sets