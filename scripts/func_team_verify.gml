///func_team_verify();
//verify that there is at least one worker in the team
if(global.team[#global.map_team,n0]==-n1 && global.team[#global.map_team,n1]==-n1 && global.team[#global.map_team,n2]==-n1 && global.team[#global.map_team,n3]==-n1){
    return n0;
}
else{
    return n1;
}
