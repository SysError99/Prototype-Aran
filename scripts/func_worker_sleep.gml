///func_worker_sleep();
if(func_worker_on_bed()){
    func_tomorrow();
    //restore worker energy
    for(rstE=n0; rstE<=n3; rstE++){
        if(global.team[#global.map_team,rstE] >-n1){
            //restore
            global.work_sp[rstE] = global.work_msp[rstE];
        }
    }
    //quest
    quest_watcher(ACTION_SLEEP,global.map_file,-n1,-n1);
}
