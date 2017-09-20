_logic = param [0,objNull,[objNull]];	// Module Logic
_units = param [1,[],[[]]];				// List of Affected Units
_activated = param [2,true,[true]];		// T = Module Active / F = Deactive (No Synced Triggers)

// Module specific behavior. Extract arguments from logic and use them.
if (_activated) then {
	hint "Activated!";
};

true;