_grp1Dist = (getPos ((units SupportGroup1) call BIS_fnc_selectRandom)) distance (waypointPosition [SupportGroup1, 0]);
_grp2Dist = (getPos ((units SupportGroup2) call BIS_fnc_selectRandom)) distance (waypointPosition [SupportGroup2, 0]);
_grp3Dist = (getPos ((units SupportCraftGroup) call BIS_fnc_selectRandom)) distance (waypointPosition [SupportCraftGroup, 0]);

if(_grp1Dist <= 50 || _grp2Dist <= 50 || _grp3Dist <= 50) then {
	{
		_x addAction ["Send 'GO' to Support Groups", "actions\support\startSupportAttack.sqf"];
	} foreach teamLeaderUnits;
	GO_COMMAND_GIVEN = true;
};