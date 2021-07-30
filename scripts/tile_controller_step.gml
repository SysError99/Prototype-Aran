///tile_controller_step();
if(global.game_paused == n0){
    var currentwork = global.team[#global.map_team,global.current_work];
    //countdown
    if(update>0){update=update-1;}
    //execute
    else{
        block_update_x=n0; block_update_y=n0; repeat(135){
            //block update
            func_block_update(global.work_x[global.current_work]-n4+block_update_x,global.work_y[global.current_work]-n7+block_update_y);
            //scroll
            if(block_update_x<n9) {
                block_update_x++;
            } else {
                block_update_x=n0;
                block_update_y++;
            }
        }
        //mouse holding control
        if(mouse_check_button(mb_left)){hold=1;func_worker_control();}else{hold=0;}
        //block process
        if(instance_exists(blo_task)){with(blo_task){block_task();}}
        //object process
        if(instance_exists(obj_task)){with(obj_task){object_task();}}
        //worker update
        for(w=3;w>=0;w--){
            if(global.work_db[w] >-1){//worker exists
                //fetch
                global.work_lv[w]=ds_map_find_value(global.work[|currentwork],LV);
                //cap hp&stamina
                global.work_hp[w]=clamp(global.work_hp[w],0,100);
                global.work_sp[w]=clamp(global.work_sp[w],0,global.work_msp[w]);
                //auto
                func_worker_auto(w);
            }
        }
        //update camera
        if(cam_updated==1){cam_updated=0;}else{
            if(global.balloon_mode == n1){
                global.cam_x = global.balloon_x;
                global.cam_y = global.balloon_y;
            }else{
                global.cam_x = global.work_x[global.current_work];
                global.cam_y = global.work_y[global.current_work];
            }
        }
    update=6;}
    //weather
    switch(global.weather){
        //rain
        case 1:
            if(irandom_range(0,99)<80){
                switch(choose(0,1)){
                    case 0: instance_create(irandom_range(0,680),0,anim_rain); break;
                    default: instance_create(0,irandom_range(0,1120),anim_rain); break;
                }
            }
            break;
        //winter
    }
    //worker_cmd
    func_worker_cmd();
}
