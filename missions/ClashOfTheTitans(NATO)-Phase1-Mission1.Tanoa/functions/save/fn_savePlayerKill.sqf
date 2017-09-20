params ["_killed", "_player", "_instigator"];
if(!isServer) exitWith {};
private _totalKills = objNull;
private _killedClasses = objNull;
private _typeToAdd = "";
private _playerID = owner _player;

_kills = profileNamespace getVariable ["DK_cmp_Kills", objNull];
if(!isNull _kills) then {
	_totalKills = _kills select 0;
	_killedClasses = _kills select 1;
	for "_x" from 0 to (count _killedClasses) - 1 do {
		private _unitName = (_killedClasses select _x) select 0;
		private _timesKilled = (_killedClasses select _x) select 0;
	};
};