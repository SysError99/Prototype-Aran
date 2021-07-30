///tile_draw0();
//block floor
for(j=0;j<=14;j++){ for(i=0;i<=8;i++){
    var tX = i - 4;
    var tY = j - 7;
    var cX = global.cam_x + tX;
    var cY = global.cam_y + tY;
    var draw = func_map_read(cX,cY);
    if(draw > -1) {
        if(global.tile_0[draw]>-1) {
            draw_sprite_ext(global.tile_0[draw],0,(i*80)+40,(j*80)+40,1,1,0,c_white,1);
            //HP for flat floor
            if(global.tile_1[draw]<0){
                draw_set_colour(c_black);
                draw_set_alpha(func_map_dmg_read(cX,cY)/func_block_health(draw));
                draw_rectangle(i*80,j*80,(i*80)+80,(j*80)+80,false);
                draw_set_colour(c_white);
                draw_set_alpha(1);
            }
        }
    }
    else{
        //out bounds
        draw_sprite_ext(spr_tile_water, 0, (i*80)+40, (j*80)+40, 1,1,0, c_gray, 1);
    }
}}
//block top, object, and worker
for(j=0;j<=14;j++){ for(i=0;i<=8;i++){
    var tX = i - 4;
    var tY = j - 7;
    var cX = global.cam_x + tX;
    var cY = global.cam_y + tY;
    //block
    var draw = func_map_read(cX,cY);
    if(draw > -1) {
        var dMHP = func_block_health(draw);
        var dDMG = func_map_dmg_read(cX,cY);
        var blend = 255*((dMHP-dDMG)/dMHP);
        var drawHp = make_colour_rgb(blend,blend,blend);
        if(global.tile_1[draw]>-1) {
            draw_sprite_ext(global.tile_1[draw],0,(i*80)+40,(j*80)+40,1,1,0,drawHp,1);
        }
        //tile effects
        if(dDMG<0){
            tile_effects(i*80,j*80,dDMG,cX,cY);
            func_map_dmg_write(cX,cY,n0);
        }
    }
    //object
    draw = func_object_find(cX,cY);
    if(draw > -1) {
        //default
        var drawSp = draw.spr;
        var drawId = draw.frame;
        var drawSx = n1;
        var drawSy = n1;
        var drawRt = n0;
        var drawAp = n1;
        var drawHp = draw.ohp / draw.omhp;
        switch(draw.object){
            //coal
            case 0:
                drawSp = spr_item;
                drawId = n9+n2;
                drawSx = 0.67;
                drawSy = 0.67;
                break;
            //iron ore
            case 3:
                drawSp = spr_item;
                drawId = n7;
                drawSx = 0.67;
                drawSy = 0.67;
                break;
            //plants
            case 4:
                drawSp = spr_plant_tile;
                drawId = global.plant_grows[#draw.pid,PLANT_ID]+draw.state;
                break;
            //ladybug & spider
            case 5: case 6:
                drawSx = draw.sx;
                drawSy = draw.sy;
                drawRt = draw.rt;
                break;
        }
        draw_sprite_ext(drawSp,drawId,(i*80)+40,(j*80)+40,drawSx,drawSy,drawRt,make_colour_hsv(0,0,floor(255*drawHp)),drawAp);
    }
    //worker
    for(w=3;w>-1;w--){
        if(global.work_db[w]>-1){
            if(global.work_x[w] == cX && global.work_y[w] == cY){
                draw = ds_map_find_value(global.work[|global.work_db[w]],ID);
                if(global.work_hp[w]>0){
                    var workFrame = 1;
                    switch(global.work_walk_frame [w]){
                        case 0: workFrame = 0; break;
                        case 2: workFrame = 2; break;
                        case 3: workFrame = 3; break;
                        case 4: workFrame = 4; break;
                        case 5: workFrame = 1; break;
                        default: workFrame = 1; break;
                    }
                    switch(global.work_a[w]){
                        case 0: // RIGHT
                            draw_sprite_ext(spr_worker_anim_side,workFrame, i*80,j*80,1,1, 0, c_white,1);
                            draw_sprite_ext(spr_worker_tile_side, draw, i*80,j*80,1,1, 0, c_white,1);
                            break;
                        case 1: // UP
                            draw_sprite_ext(spr_worker_anim,workFrame, i*80,j*80,1,1, 0, c_white,1);
                            draw_sprite_ext(spr_worker_tile_back, draw, i*80,j*80,1,1, 0, c_white,1);
                            break;
                        case 2: //LEFT 
                            draw_sprite_ext(spr_worker_anim_side,workFrame, (i*80)+80,j*80,-1,1, 0, c_white,1);
                            draw_sprite_ext(spr_worker_tile_side, draw, (i*80)+80,j*80,-1,1, 0, c_white,1);
                            break;
                        case 3: // DOWN
                            draw_sprite_ext(spr_worker_anim,workFrame, i*80,j*80,1,1, 0, c_white,1);
                            draw_sprite_ext(spr_worker_tile, draw, i*80,j*80,1,1, 0, c_white,1);
                            break;
                    }
                }
                else{
                    draw_sprite_ext(spr_grave, 0, i*80,j*80,1,1, 0, c_white,1);
                }
            }
        }
    }
}}
