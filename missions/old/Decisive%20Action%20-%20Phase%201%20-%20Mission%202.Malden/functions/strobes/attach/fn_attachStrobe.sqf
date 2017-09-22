fn_attachStrobe = {
	params["_unit", "_delay"];
	
	_strobeOn = false;
	_irStrobe = Nil;
	while {true} do {
		// Add the strobe to the unit if it's not already on.
		if(!_strobeOn) then {
			_irStrobe = createVehicle ["O_IRStrobe", [0, 0, 0], [], 0, "NONE"];
			[_unit, _irStrobe, _delay] execVM "functions\strobes\action\fn_strobesOn.sqf";
			_strobeOn = true;
		};
   };
};

fn_attachStrobe;