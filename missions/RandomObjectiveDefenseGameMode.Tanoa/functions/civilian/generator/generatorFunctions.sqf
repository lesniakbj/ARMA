/*
	Author: 
		Doctor Kamikaze

	Description:
		Generates a Civilian Group in a Given Trigger Zone

	Parameter(s):
		0: NUMBER - Number of Civilians to Spawn
		1: ARRAY - Civilian Types to Spawn
		2: STRING - Behaviour of the Spawned Civilians - "SAFE"
		3: TRIGGER - The Trigger that you want to Spawn Civs in

	Returns:
		GROUP - The Civilian Group that was Generated
 */
DK_fnc_generateCivilianGroup = {
	params["_numCivs", "_civClasses", "_behavior", "_triggerZone"];
	if(!isServer) exitWith {};
	private _civGroup = grpNull;
	for "_x" from 0 to _numCivs do {
		if(isNull _civGroup) then {
			_civGroup = createGroup civilian;
		};
		_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
		_civClass = selectRandom _civClasses;
		_civ = _civGroup createUnit [_civClass, _pos, [], 0, "NONE"];
		_civ setSpeedMode "LIMITED";
		_civ setCombatMode "GREEN";
		_civ setBehaviour _behavior;
		_civ enableDynamicSimulation true;
	};

	// Return the Civ Array
	_civGroup;
};

/*
	Author: 
		Doctor Kamikaze

	Description:
		Returns a List of Civilian Classes that are in the give World

	Parameter(s):
		0: STRING - Name of the World

	Returns:
		ARRAY - The LList of Civilian Classes in the World
 */
DK_fnc_civilianClasses = {
	params["_world"];
	if(!isServer) exitWith {};

	private _civs = objNull;
	switch(_world) do {
		case "Tanoa": {
			_civs = ["C_Man_casual_1_F_tanoan", "C_Man_casual_2_F_tanoan", "C_Man_casual_3_F_tanoan", 
				"C_man_sport_1_F_tanoan", "C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan",
				"C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan"];
		};
		
		default {
			_civs = ["C_Man_casual_1_F_tanoan", "C_Man_casual_2_F_tanoan", "C_Man_casual_3_F_tanoan", 
				"C_man_sport_1_F_tanoan", "C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan",
				"C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan"];
		};
	};

	_civs;
};