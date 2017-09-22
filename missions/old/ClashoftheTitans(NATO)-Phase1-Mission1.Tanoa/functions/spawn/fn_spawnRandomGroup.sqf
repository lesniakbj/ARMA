params["_group", "_prob"];
if (!isServer) exitWith {};

private _chance = (random 100);
if (_chance > _prob) then {
	{ 
		deleteVehicle vehicle _x; 
		deleteVehicle _x; 
	} forEach units _group;
};