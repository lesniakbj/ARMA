params["_groupLeader", "_thisList"];

_playerFound = false;
{ if(_x == _groupLeader) exitWith { _playerFound = true; }; } foreach allPlayers;

if(!_playerFound) then {
	START_SUPPORT_ATTACK = true;
};