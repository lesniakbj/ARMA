params["_triggerZone"];
if(isServer) then {
	_trgArea = triggerArea _triggerZone;
	_trgCenter = getPos _triggerZone;
	_aPos = objNull;
	_bPos = objNull;
	_zPos = 0;

	// Unpack Trigger Area
	_trgA = (_trgArea select 0);
	_trgB = (_trgArea select 1);
	_trgIsRectangle = (_trgArea select 3);

	// Generate Coordinates for the 1st Quadrant (+/+)
	if(_trgIsRectangle) then {
		_aPos = (floor (random _trgA));
		_bPos = (floor (random _trgB));
	} else {
		if(_trgA == _trgB) then {
			// Circle
			_rndRadius = floor (random _trgA);
			_theta = floor (random 90);
			_aPos = _rndRadius * (cos _theta);
			_bPos = _rndRadius * (sin _theta);
		} else {
			// Ellipse
			_theta = floor (random 90);
			_AB = _trgA * _trgB;
			_aSin = ((_trgA * _trgA) * ((sin _theta) * (sin _theta)));
			_bCos = ((_trgB * _trgB) * ((cos _theta) * (cos _theta)));
			_sqrt = sqrt (_aSin + _bCos);
			_radius = _AB / _sqrt;
			_rndRadius = floor (random _radius);
			_aPos = _rndRadius * (cos _theta);
			_bPos = _rndRadius * (sin _theta);
		};
	};
	
	// Add a random chance to switch to other Quadrants (+/-, -/+, -/-)
	_aPos = if((random 1) > .50) then { _aPos; } else { -_aPos; };
	_bPos = if((random 1) > .50) then { _bPos; } else { -_bPos; };
	
	// Translate the offset to the World Model and Ground Level
	_transPos = _triggerZone modelToWorld [_aPos, _bPos, _zPos];
	_transPos = ASLToAGL _transPos;
	_transPos;
};