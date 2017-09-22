["DK_cmp_Kills"] call DK_fnc_loadStat;
["DK_cmp_Deaths"] call DK_fnc_loadStat;
["DK_cmp_Civilians"] call DK_fnc_loadStat;
["DK_cmp_Vehicles"] call DK_fnc_loadStat;
["DK_cmp_Score"] call DK_fnc_loadStat;

//END
player globalChat format ["Player %1 has successfully loaded.", name player];