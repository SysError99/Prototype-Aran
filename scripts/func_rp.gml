///func_rp(amount);
if(global.data[?RP]>=abs(argument0)){
    global.data[?RP] = global.data[?RP] - argument0;
    //quest
    quest_watcher(ACTION_RP_USE,argument0,-n1,-n1);
return n1;}else{return n0;}
