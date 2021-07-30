///quest_get_list(questname);
//get value of requested quest
var _questText = "";
var _questTarget = n0;
//find
switch(argument0){
    //2020-jan
    case "2020_jan_kill_spider": _questTarget = n2*n5; break;
    case "2020_jan_kill_grasshopper": _questTarget = n2*n2*n5; break;
    case "2020_jan_kill_ladybug": _questTarget = n2*n2*n2*n5; break;
}
//check
if(_questTarget>n0){
    if(ds_map_exists(global.quest,argument0)){ //exists
        var _questVal = global.quest[?argument0];
        if(_questVal<_questTarget){
            _questText = "( "+string(_questVal)+" / "+string(_questTarget)+" )"; //incomplete
        }
        else{
            _questText = "c"; //completed
        }
    }
    else{
        _questText = "( 0 / "+string(_questTarget)+" )"; //non-exist
    }
}
return _questText;
