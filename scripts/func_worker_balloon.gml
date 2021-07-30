///func_walker_balloon()
//toggle balloon drive
if(room==room_game){
    if(global.balloon_mode == n0){
        if(global.map_underground == n0){
            var balloonPeopleExists = true;
            for(w=n3;w>=n0;w--){
                if(global.work_db[w] > -n1){
                    if(point_distance(global.work_x[w],global.work_y[w],global.cam_x,global.cam_y) > n5){
                        balloonPeopleExists = false; //too far
                    }
                }
            }
            if(balloonPeopleExists){
                global.balloon_mode = n1;
                global.balloon_x = global.cam_x;
                global.balloon_y = global.cam_y;
                for(w=n3;w>=n0;w--){
                    if(global.work_db[w] > -n1){
                        global.work_x [w] = -n1;
                        global.work_y [w] = -n1;
                    }
                }
            }else{
                func_noti_top(global.txt_balloon_worker_gather, spr_item, 62);
            }
        }else{
            func_noti_top(global.txt_notready, spr_item, 62);
        }
    }else{ //balloon landing
        var balloonLandable = n1;
        for(w=n3;w>=n0;w--){
            if(global.work_db[w] > -n1){
                var balloonLandX = global.cam_x;
                var balloonLandY = global.cam_y;
                switch(w){
                    case 1: balloonLandX++; break;
                    case 2: balloonLandY++; break;
                    case 3: balloonLandX++; balloonLandY++; break;
                }
                if(func_obstacle(balloonLandX, balloonLandY) == n1){
                    balloonLandable = n0;
                }else{
                    global.work_x [w] = balloonLandX;
                    global.work_y [w] = balloonLandY;
                }
            }
        }
        if(balloonLandable == n1){
            global.balloon_mode = n0;
        }
        else{
            func_noti_top(global.txt_balloon_no_land, spr_item, 62);
        }
    }
}
