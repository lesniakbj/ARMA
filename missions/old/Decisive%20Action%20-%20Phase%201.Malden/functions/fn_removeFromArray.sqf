params["_objArr", "_objToRemove"];

_index = _objArr find (_objToRemove);
if(_index != -1) then {
	_objArr deleteAt _index;
};