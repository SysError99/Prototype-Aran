///func_worker_walk(worknum, xabs, yabs);
var _workX = global.work_x[argument0];
var _workY = global.work_y[argument0];
var _wX = _workX+argument1;
var _wY = _workY+argument2;
var _WorkerCanWalk = n0;
//facing
if(argument1>0){global.work_a[argument0] = 0;}//R
else if(argument2<0) {global.work_a[argument0] = 1;}//U
else if(argument1<0){global.work_a[argument0] = 2;}//L
else if(argument2>0){global.work_a[argument0] = 3;}//D
//walk
if(func_obstacle(_wX,_wY)==n0){//nothing blocks path
    _WorkerCanWalk=n1;
    global.work_x[argument0] = clamp(_wX,0,191);
    global.work_y[argument0] = clamp(_wY,0,191);
    func_lose_stamina(argument0);//consume stamina
    global.result_unit_moves++; //result_count
    //anim
    switch(global.work_walk_frame[argument0]){
        case 0:  global.work_walk_frame [argument0] = n1; break;
        case 1:  global.work_walk_frame [argument0] = n2; break;
        case 2:  global.work_walk_frame [argument0] = n5; break;
        default: global.work_walk_frame [argument0] = n0; break;
    }
    //sound
    if(argument0==global.current_work){
        func_sound_walk();
    }
    //quest
    quest_watcher(ACTION_WALK,global.map_file,-n1,-n1);
}
return _WorkerCanWalk;
