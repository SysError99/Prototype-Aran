///func_worker_control();
if(global.balloon_mode == n1){ //if on balloon
    if(move_xabs!=0||move_yabs!=0){
        global.balloon_x = clamp(global.balloon_x + move_xabs, n0, 191);
        global.balloon_y = clamp(global.balloon_y + move_yabs, n0, 191);
        //update_camera
        cam_updated=1;
        global.cam_x = global.balloon_x
        global.cam_y = global.balloon_y
    }
}
else if(func_worker_ready(global.current_work)>n0){//check stamina sufficiency
    if(global.work_at[global.current_work] <= n0){//not in auto mode
        //tool use
        if(point_in_rectangle(mouse_x,mouse_y,240,960,480,1200)) {func_worker_tool_use(global.current_work);}
        //walk
        else if(move_xabs!=0||move_yabs!=0){
            if(global.all_walk_enabled > n0){
                var walkObstacles = n0;
                for(w=n0;w<=n3;w++){
                    //check for obstacles
                    if(global.work_db[w] > -n1){
                        allWalkWalked[w] = n0;
                        walkObstacles += func_block_get_collide(global.work_x[w]+move_xabs,global.work_y[w]+move_yabs) 
                                        +func_object_get_collide(global.work_x[w]+move_xabs,global.work_y[w]+move_yabs);
                    }
                }
                if(walkObstacles == n0){
                    //walk if no obstacles in all workers
                    var allWalkAttempt = 0; while(allWalkAttempt < 4){//4 times max
                        for(w=n0;w<=n3;w++){
                            if(global.work_db[w] > -n1){
                                if(allWalkWalked[w] == n0 && global.work_at[w]==n0){
                                    allWalkWalked[w] = func_worker_walk(w,move_xabs,move_yabs);
                                }
                            }
                        }
                    allWalkAttempt++;}
                }
            }
            else{
                //one-worker-walk
                func_worker_walk(global.current_work,move_xabs,move_yabs);
            }
            
            //update_camera
            cam_updated=1;
            global.cam_x = global.work_x[global.current_work];
            global.cam_y = global.work_y[global.current_work];
        }
    }
}
