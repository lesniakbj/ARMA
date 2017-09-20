/*
// Camera Shots
_playersStart = [[13510.9, 2982.37, 10.7772], [-36.6739,0]];
_civsCaptured = [[13357, 2663.47, 4.77862], [-21.6188,0]];

// Camera Setup
_cam = "camera" camCreate (_civsCaptured select 0);
_cam cameraEffect ["External", "BACK"];

// Initial Opening Credits
cutText ["","Black Faded"];
sleep 1;
titleText ["Doctor Kamikzae Presents", "PLAIN", 1];
sleep 3.5;
titleText ["An ARMA 3 Creation", "PLAIN", 1];
sleep 3.5;
cutText ["","Plain"];
sleep 3.5;

// Move the camera to the _civs
_cam camSetPos (_playersStart select 0);
_cam camSetDir (_playersStart select 1);
_cam camCommit 3;
waitUntil { camCommitted _cam; };
sleep 5;

// Remove the Camera
_cam cameraEffect ["Terminate", "BACK"];
camDestroy _cam;
*/