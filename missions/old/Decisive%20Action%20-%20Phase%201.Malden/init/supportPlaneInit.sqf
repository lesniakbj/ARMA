_this setPylonLoadOut [1, "PylonMissile_1Rnd_BombCluster_03_F"];
_this setPylonLoadOut [2, "PylonMissile_1Rnd_BombCluster_03_F"];
_this setPylonLoadOut [3, "PylonRack_2Rnd_BombCluster_01_F"];
_this setPylonLoadOut [4, "PylonRack_2Rnd_BombCluster_01_F"];
_this setPylonLoadOut [5, "PylonMissile_Missile_BIM9X_x1"];
_this setPylonLoadOut [6, "PylonMissile_Missile_BIM9X_x1"];
_this setPylonLoadOut [11, "PylonMissile_1Rnd_BombCluster_01_F"];
_this setPylonLoadOut [12, "PylonMissile_1Rnd_BombCluster_01_F"];
_this addEventHandler ["Fired", {
	params["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	hint (format ["Unit: %1, Weapon: %2, Muzzle: %3, Mode: %4, Ammo: %5, Magazine: %6", _unit, _weapon, _muzzle, _mode, _ammo, _magazine]);
	_unit fire [_muzzle, _mode, _magazine];
}];