// Turn on all of the groups IR Strobes.
_callingTL =  (_this select 1);
_grp = (group _callingTL);
_strobeTime = (.5 + (random .5));
[_grp, _strobeTime] execVM "functions\strobes\attach\fn_strobesAttachByGroup.sqf";

// Add the command to turn them back off.
_actionID = (_this select 2);
_callingTL removeAction _actionID;
// _callingTL addAction ["Turn Off IR Strobes", "actions\IRStrobe\strobesOff.sqf"];