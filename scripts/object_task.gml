///object_task();
//scripts
switch(object){
    //1: smelter
    case 1:
        //smelting
        if(time>n0){
            time = time - n1;
            spr=spr_tile_furnace_fire;//anim_smelting
        }
        //smelted
        else if(inside>-n1){
            func_item_add(inside,n1);//give item
            inside=-n1;
        }
        //idle
        else{
            spr=spr_tile_furnace;//anim_idle
            var itemObject = func_object_find(ox,oy+n1);//find item object
            if(itemObject>-n1){
                if(itemObject.object==n0){
                    var itemID = itemObject.item;
                    switch(itemID){
                        case 11: coals++; func_object_free(ox,oy+n1,n1); break; //coal,suck in
                        //smelter block list
                        case 7: if(coals>=n2) {inside=n9; time=(n2*n2*n3)*n3*n5; coals=coals-n2;} break; //iron ore: 15s
                        case 57: if(coals>=n1) {inside=(n2*n5*n5)+n8; time=(n2*n2*n3)*n2*n2*n2; coals=coals-n1;}break;//fish: 8s
                    }
                    if(inside>-n1){func_object_free(ox,oy+n1,n1);}//suck in
                }
            }
        }
        break;
    //monsters
    case 5:
    case 6:
    case 7:
        if(px>=0&&py>=0&&px<=8&&py<=14){if(cd>=n0){cd--;}else{//if monsters are in sight
            //specified script
            switch(object){
                //0: ladybug
                case 5: 
                    //animation
                    if(spr==spr_tile_monster_0){
                        spr=spr_tile_monster_0_0;
                    }else{
                        spr=spr_tile_monster_0;
                    }
                    break;
                //1: spider
                case 6: 
                    if(sx == n1){sx = -n1;}else{sx = n1;}//mirror
                    //find preys
                    for(i=n0;i<=n3;i++){
                        var aimX = ox;
                        var aimY = oy;
                        var vdir = i;
                        switch(vdir){
                            case 0: aimX+=n1; break;
                            case 1: aimY-=n1; break;
                            case 2: aimX-=n1; break;
                            case 3: aimY+=n1; break;
                        }
                        //find worker
                        var workerSeek = func_get_worker(aimX,aimY);
                        var objSeek = func_object_get_id(aimX,aimY);
                        if(workerSeek>-n1){
                            //attack
                            if(global.work_hp[workerSeek]>n0){
                                global.work_hp[workerSeek] = global.work_hp[workerSeek] -n9 -n1;
                                fx_fade_in(c_red,30);
                                func_sound_hit1();
                            }
                        }
                        //other monsters attack
                        else{
                            switch (objSeek){
                                case 5:
                                case 6:
                                case 7:
                                    func_object_hit(aimX,aimY,n9+n1,"");
                                    break;
                            }
                        }
                        
                    }
                    break;
                //grasshopper
                case 7:
                    //find plants
                    for(i=n0;i<=n3;i++){
                        var aimX = ox;
                        var aimY = oy;
                        var vdir = i;
                        switch(vdir){
                            case 0: aimX+=n1; break;
                            case 1: aimY-=n1; break;
                            case 2: aimX-=n1; break;
                            case 3: aimY+=n1; break;
                        }
                        if(func_object_get_id(aimX,aimY) == n4){
                            func_object_hit(aimX,aimY,n9+n1,"");
                        }
                    }
                    break;
            }
            //move
            if(targeted==n0){
                //random dir
                if(irandom_range(n0,11*n3*n3)<=n5*n2*n5){
                    dir = irandom_range(n0,n3);
                }
                //choose dir
                var gotoX = ox;
                var gotoY = oy;
                switch(dir){
                    case 0: gotoX +=n1; rt = 270;break;
                    case 1: gotoY -=n1; rt = 0;  break;
                    case 2: gotoX -=n1; rt = 90; break;
                    case 3: gotoY +=n1; rt = 180;break;
                }
                //walk
                if(func_obstacle(gotoX,gotoY)==n0){
                    //delete old position
                    global.map_obj [ox,oy] = -n1;
                    //new position
                    ox=clamp(gotoX,0,191);
                    oy=clamp(gotoY,0,191);
                    global.map_obj [ox,oy] = id;
                }
            }
        cd=n6;}}//cooldown
        break;
    //tnt
    case 9:
        if(frame>n0){frame=n0;}else{frame=n1;}
        if(time>n0){time--;}else{
            //destroy
            ds_grid_set_disk(global.map,ox,oy,n6,n9+n6);
            ds_grid_set_disk(global.map_dmg,ox,oy,n6,-n2*n5*n2*n5*n2*n5*n2*n5*n2*n5);
            repeat(2){func_sound_obj_destroy();}
            ohp=0;
        }
        break;
    //sit place
    case 11:
        for(w=3;w>0;w--){
            if(global.work_x[w] == ox && global.work_y[w] == oy){
                global.work_sp [w] = global.work_sp[w] + 2; //rgenerate hp
                break;
            }
        }
        break;
}
//dead
if(ohp<=0) {
    if(consume==n0){
        var count = n1;
        switch(object){
            //don't count these items in result
            case 1:
            case 3:
        count = n0; break;}
        //drop item
        if(atkb == "worker" && count==n1){//if being attacked by a player
            func_xp_gain(n1,object);
            var gotItem = -n1;
            //quest
            if(object==n4){//plant
                func_plant_item_drops();
                quest_watcher(ACTION_PLANT_FREE,pid,state,-n1);
                
            }
            else{//other object
                //drop item
                gotItem = func_object_item_drops(object);        
                quest_watcher(ACTION_OBJ_FREE,object,-n1,-n1);
            }
            //if items discovered, add to result
            if(gotItem>-n1){
                func_game_result_add(gotItem);
                //quest
                quest_watcher(ACTION_ITEM_DROP,gotItem,global._itemDropAmount,-n1);
            }
            func_sound_obj_destroy();//fx_die
        }
        //get item
        else{
            func_object_item_drops(object);
        }
    }
    //free
    global.map_obj [ox,oy] = -n1;
    instance_destroy();
}
