class CfgPatches {
	class DK_CivilianZone {
		units[] = {"DK_CivilianZoneModule"};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F"};
	};
};

class CfgFactionClasses {
	class DK;
	class DK_CivilianZoneClass: DK {
		displayName = "DK Civilian Zone";
	};
};

class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
			class Units;
		};
		class ModuleDescription {
			class EmptyDetector;
		};
	};
	
	class DK_CivilianZoneModule: Module_F {
		scope = 2; 										// 2 = Show, 1 = Hide
		displayName = "Civilian Population Zone"; 		// Name displayed in the menu
		category = "Population";						// Name of Module Category
		function = "DK_fnc_civilianPopulationZone";		// Name of Function
		functionPriority = 1;							// Execution priority, lower = earlier
		isGlobal = 0;									// 0 = Server Only, 1 = Global, 2 = Persistent Global
		isTriggerActivated = 1;							// 1 = Wait for Synced Triggers, 0 = Don't Wait
		isDisposable = 0;								// 1 = Disabled Once Activated, 0 = Not Disabled
		is3DEN = 1;										// 1 = Run Init in Eden
		curatorInfoType = "RscDisplayAttributeCivilianZoneModule";

		class Arguments: ArgumentsBaseUnits {
			// Arguments shared by specific module type (have to be mentioned in order to be placed on top)
			class Units: Units {};
			
			class DK_MinCivilians {
				displayName = "Minimum Civilians Present"; 	// Argument label
				description = ""; 							// Tooltip description
				typeName = "NUMBER"; 						// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = 7;
			};
			
			class DK_MaxCivilians {
				displayName = "Maximum Civilians Present"; 	// Argument label
				description = ""; 							// Tooltip description
				typeName = "NUMBER"; 						// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = 15;
			};
		};
		
		class ModuleDescription: ModuleDescription {
			description = "DK Town Population Module";
			sync[] = {};
			position = 0; 		// Position is taken into effect
			direction = 0; 		// Direction is taken into effect
		};
	};
};

class CfgFunctions {
	class DK {
		tag = "DK";
		class CivilianModule {
				file = "\DK_civilianModule\functions";
				class fn_civilianPopulationZone{};
			};
		};
	}
};