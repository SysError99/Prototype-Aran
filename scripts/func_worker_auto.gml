///func_worker_auto(worknum);
var atwX = 0;
var atwY = 0;
switch(global.work_a [argument0]){
    case 0: atwX = 1; break;
    case 1: atwY =-1; break;
    case 2: atwX =-1; break;
    case 3: atwY = 1; break;
}
var atpX = global.work_x [argument0] + atwX;
var atpY = global.work_y [argument0] + atwY;
var atO = func_object_find(atpX,atpY);
//all auto
if(global.work_at[argument0]>n0 && func_worker_ready(argument0)>n0){
    //pick item
    func_worker_pick(argument0);
    //use tool
    func_worker_tool_use(argument0);
    //walk
    if(atO<n0 || func_tool_power(func_map_read(atpX,atpY),global.work_tool_id[argument0]) <= n0){
        func_worker_walk(argument0,atwX,atwY);
    }
}
//auto attack monsters
else if(atO > -n1){
    if(func_mcheck(atO.object)>n0){
        func_worker_tool_use(argument0);
    }
}
