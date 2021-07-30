///func_worker_on_bed();
var bedExists = true;
for(bE=n0; bE<=n3 && bedExists==true; bE++){
    if(global.team[#global.map_team,bE] >-n1){
        if(!func_bed_exists(global.work_x[bE],global.work_y[bE])){
            bedExists = false;
        }
    }
}
return bedExists;
