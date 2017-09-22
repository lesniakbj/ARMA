if(!isServer) exitWith {};

// Setup the ServerID and make it Public
private _serverHasID = profileNameSpace getVariable ["DK_cmp_ServerID", nil];
if(isNil "DK_cmp_ServerID") then {
	_serverID = str(round((random(100000)) + random 10000));
	profileNameSpace setVariable ["DK_cmp_ServerID", _serverID];
};
serverID = profileNameSpace getVariable "DK_cmp_ServerID";
publicVariable "DK_cmp_ServerID";