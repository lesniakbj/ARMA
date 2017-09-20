params["_saveGroup"];
_cnt = ({alive _x} count units _saveGroup); 
if(_cnt >= 2) then {
    SaveCivTask setTaskState "Succeeded";
} else {
    SaveCivTask setTaskState "Failed";
};