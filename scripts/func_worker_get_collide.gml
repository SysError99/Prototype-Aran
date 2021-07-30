///func_worker_get_collide(x,y);
var _workerCollide = n0;
for(i=n3; i>=n0 && _workerCollide==n0; i--){
    if(global.team[#global.map_team,i]>-n1){
        if(global.work_x[i]==argument0&&global.work_y[i]==argument1){
            _workerCollide=n1;
        }
    }
}
return _workerCollide;
