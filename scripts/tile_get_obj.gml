///tile_get_obj();
//upload obj drawing to tile
if(instance_exists(obj_task)){with(obj_task){
    //find tile pos
    px = ox-(global.cam_x-n4);
    py = oy-(global.cam_y-n7);
    if(px>=0&&py>=0&&px<=8&&py<=14){
        //current_health
        global.obj_tile[px,py].mohp = ohp;
        global.obj_tile[px,py].momh = omhp;
        switch(object){
            case 0://coal
                global.obj_tile[px,py].mosp = spr_item;
                global.obj_tile[px,py].moid = n9+n2;
                global.obj_tile[px,py].mosx = 0.67;
                global.obj_tile[px,py].mosy = 0.67;
                global.obj_tile[px,py].mort = n0;
                global.obj_tile[px,py].moap = n1;
                break;
            case 3: //iron ore
                global.obj_tile[px,py].mosp = spr_item;
                global.obj_tile[px,py].moid = n7;
                global.obj_tile[px,py].mosx = 0.67;
                global.obj_tile[px,py].mosy = 0.67;
                global.obj_tile[px,py].mort = n0;
                global.obj_tile[px,py].moap = n1;
                break;
            case 4: //plants
                global.obj_tile[px,py].mosp = spr_plant_tile;
                global.obj_tile[px,py].moid = global.plant_grows[#pid,PLANT_ID]+state;
                global.obj_tile[px,py].mosx = n1;
                global.obj_tile[px,py].mosy = n1;
                global.obj_tile[px,py].mort = n0;
                global.obj_tile[px,py].moap = n1;
                break;
            case 5: case 6: //monster0: ladybug & monster1: spider
                global.obj_tile[px,py].mosp = spr;
                global.obj_tile[px,py].moid = n0;
                global.obj_tile[px,py].mosx = sx;
                global.obj_tile[px,py].mosy = sy;
                global.obj_tile[px,py].mort = rt;
                global.obj_tile[px,py].moap = n1;
                break;
            case 8: //tnt
                global.obj_tile[px,py].mosp = spr;
                global.obj_tile[px,py].moid = frame;
                global.obj_tile[px,py].mosx = n1;
                global.obj_tile[px,py].mosy = n1;
                global.obj_tile[px,py].mort = n0;
                global.obj_tile[px,py].moap = n1;
                break;
            default://default drawing routine
                global.obj_tile[px,py].mosp = spr;
                global.obj_tile[px,py].moid = frame;
                global.obj_tile[px,py].mosx = n1;
                global.obj_tile[px,py].mosy = n1;
                global.obj_tile[px,py].mort = n0;
                global.obj_tile[px,py].moap = n1;
                break;
        }
    }
}}
