params["_triggerZone"];
if(!isServer) exitWith {};

private _trgArea = triggerArea _triggerZone;
_trgArea params ["_trgCenter", "_trgA", "_trgB", "_angle", "_trgIsRectangle"];

// Generate Coordinates
private _offset = [];
if(_trgIsRectangle) then {
	private _2a = _trgA * 2;
    private _2b = _trgB * 2;
	_offset = [random(_2a) - _trgA, random(_2b) - _trgB, 0];
} else {
	// Generate random point
	private _rho = random 1;
	private _phi = random 360;

    // Scale
    private _x = sqrt(_rho) * cos(_phi);
    private _y = sqrt(_rho) * sin(_phi);

    _offset = [_x * _trgA, _y * _trgB, 0];
};

// Translate the Offset to the WorldModel Pos and Rotation of Trigger at Ground Level
_rotatedPos = [_offset, _angle] call BIS_fnc_rotateVector2D;
_transPos = _triggerZone modelToWorld _rotatedPos;
_transPos = ASLToATL _transPos;
_transPos;