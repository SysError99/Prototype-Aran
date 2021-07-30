///tile_update();
//update screen tiles on the current time
with(tile){
    //get tile position to read
    cx = global.cam_x+tx;
    cy = global.cam_y+ty;
    //tiles & objects
    if(cx >=0 && cx <= 191 && cy >= 0 && cy <= 191) {
        //inbound area
        //block
        m = func_map_read(cx,cy);
        dmg = func_map_dmg_read(cx,cy);
        mhp = func_block_health(m);
        //obj
        if(global.map_obj [cx,cy] >-n1){
            if(!instance_exists(func_object_find(cx,cy))){
                global.map_obj [cx,cy] = -n1;
            }
        }
        //workers
        mw = -1; //reset first
        for(w=3;w>-1 && mw = -1;w--){
            var teamSelect = global.team[#global.map_team, w];
            if(teamSelect != -1){
                var worker = ds_map_find_value(global.work[|teamSelect],ID);
                if(worker != -1){// if there is a worker in this slot
                    if(cx = global.work_x[w] && cy = global.work_y[w]){
                        //if there is a worker on this slot
                        mw = worker;
                        mwh = global.work_hp[w] / (n2*n5*n2*n5);
                        mwo = global.work_a[w];
                        //animation
                        switch(global.work_walk_frame [w]){
                            case 0: mwf = 0; break;
                            case 2: mwf = 2; break;
                            case 3: mwf = 3; break;
                            case 4: mwf = 4; break;
                            case 5: mwf = 1; break;
                            default: mwf = 1; break;
                        }
                    }
                }
            }
        }
        //effects
        //if(dmg<0){tile_effects(dmg);}
    }else{
        //outbound area
        m = -1;
        mw = -1;
    }
}
//update effects position
if(instance_exists(effects)){with(effects){tx=cx-global.cam_x;ty=cy-global.cam_y;}}
