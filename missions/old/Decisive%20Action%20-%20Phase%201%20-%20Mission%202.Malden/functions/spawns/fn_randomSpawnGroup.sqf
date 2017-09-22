if (!isServer) exitWith {};

_grp = (_this select 0);
_prob = _this select 1;
_chance = (random 100);

if (_chance > _prob) then
{
	{ 
		deleteVehicle vehicle _x; 
		deleteVehicle _x; 
	} forEach units _grp;
};