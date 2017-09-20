params["_world"];
_civs = objNull;
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