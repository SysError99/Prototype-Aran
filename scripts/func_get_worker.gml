///func_get_worker(x,y);
//find worker id by position (or leave 1 if not exist)
var _workerExists = -n1;
for(_w=n3;_w>-n1;_w--){
    if(global.team[#global.map_team,_w] >-n1){//worker exists
        if(global.work_x[_w] == argument0 && global.work_y[_w] == argument1){
            _workerExists = _w;
        }
    }
}
return _workerExists;
