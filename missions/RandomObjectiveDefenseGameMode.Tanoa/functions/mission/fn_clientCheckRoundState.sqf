params[];

_lastState = "";
while {ROUND_STATE != "GAME_END"} do {
	_state = ROUND_STATE;

	if(_state != _lastState) then {
		if(_state == "Buy") then {
			_action = player addAction ["BUY", {}];
			player setVariable ["DK_BuyAction", _action, false];
		};

		if(_state == "Round Start") then {
			_action = player getVariable "DK_BuyAction";
			player removeAction _action;
		};
	};

	_lastState = _state;
};