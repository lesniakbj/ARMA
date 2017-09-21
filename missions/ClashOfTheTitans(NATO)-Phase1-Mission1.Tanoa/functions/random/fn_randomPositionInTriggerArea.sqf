params["_triggerZone"];
if(!isServer) exitWith {};

private _trgArea = triggerArea _triggerZone;
_trgArea params ["_trgCenter", "_trgA", "_trgB", "_angle", "_trgIsRectangle"];

// Generate Coordinates
private _offset = [];
if(_trgIsRectangle) then {
	private _2A = _trgA * 2;
    private _2B = _trgB * 2;
	_offset = [random(_2A) - _trgA, random(_2B) - _trgB, 0];
} else {
	// Generate random point on Unit Circle
	private _radius = random 1;
	private _theta = random 360;
    private _xPos = sqrt(_radius) * cos(_theta);
    private _yPos = sqrt(_radius) * sin(_theta);

 	// Scale
    _offset = [_xPos * _trgA, _yPos * _trgB, 0];
};

// Translate the Offset to the WorldModel Pos and Rotation of Trigger at Ground Level
_rotatedPos = [_offset, _angle] call BIS_fnc_rotateVector2D;
_transPos = _triggerZone modelToWorld _rotatedPos;
_transPos = ASLToATL _transPos;
_transPos;