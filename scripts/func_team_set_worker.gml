///func_team_set_worker(team,position,workerid);
//check if that chara is not currently used on any slots
if(argument0>=n0 && argument0<=n8 && argument1>=n0 && argument1<=n3){
    if(global.team[#argument0,n0]!=argument2 && global.team[#argument0,n1]!=argument2 && global.team[#argument0,n2]!=argument2 && global.team[#argument0,n3]!=argument2){
        global.team[#argument0,argument1] = argument2;
        return n1;
    }
    else{
        return n0;
    }
}
else{
    return n0;
}
