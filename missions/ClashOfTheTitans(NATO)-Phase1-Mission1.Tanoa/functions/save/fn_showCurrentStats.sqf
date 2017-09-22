private _brk = "<br />";

// Player Name
private _player = "Player:  %1";
private _filler = "";
for "_x" from 0 to (count _player) do {
	_filler = _filler + "-";
};
private _sep = "<br />" + _filler + "<br />";

private _kills = "Kills: %2";
["DK_cmp_Kills"] call DK_fnc_loadStat;


private _mostKilled = "Most Killed Type: %3";
private _deaths = "Deaths: %4";
private _mostDeaths = "Most Deaths By: %5";
private _txt = _player + _sep + _kills + _brk;
hint parseText (format [_txt, name player, DK_cmp_Kills]);