///func_worker_tool_use(worknum);
if(global.team[#global.map_team,argument0]>-1){//if there is a worker on the slot
    var px = global.work_x[argument0];
    var py = global.work_y[argument0];
    //direction
    switch(global.work_a[argument0]){
        case 0: px++; break;//R
        case 1: py--; break;//U
        case 2: px--; break;//L
        case 3: py++; break;//D
    }
    switch(global.work_tool_id[argument0]){
        case 5: //watering
            if(func_map_read(px,py) == n6){
                func_item_add(n6*n2*n5+n4,n1); //add water
                func_sound_powup(); //sfx
            }else if(func_map_read(px,py) == n9+n5){
                if(func_item_use(n6*n2*n5+n4,n1)){ //use water
                    func_map_write(px,py,n9+n8) //fine ground
                }
            }
            break;
        default:
            //object attack
            var obj = func_object_find(px,py);
            if(obj > -n1){
                var objectid = obj.object;
                var toolDMG = func_tool_damage(objectid,global.work_tool_id[argument0]) *  (n1 + (0.025*global.work_lv [argument0]) + (0.05*global.work_tool_lv [argument0]));
                if(toolDMG>n0){
                    func_object_hit(px,py,toolDMG,"worker"); 
                    func_lose_stamina(argument0);//consume stamina
                    func_sound_hit0();//sound
                    func_worker_anim_atk(argument0);//anim
                }
            }
            //block destroy
            else {
                var block=func_map_read(px,py);
                var toolPower=func_tool_power(block,global.work_tool_id[argument0]);
                if(toolPower>0 && func_block_health(block)>0){
                    //show_message(string(argument0) + ":" + string(global.work_lv[argument0])+","+global.work_tool_lv[argument0]);
                    //deal damage to block
                    if(func_block_hit(px,py,(toolPower *  (n1 + (0.025*global.work_lv[argument0]) + (0.05*global.work_tool_lv[argument0]))),"worker")==n0){    
                        func_lose_stamina(argument0);//consume stamina
                        //sound
                        if(argument0==global.current_work){
                            func_sound_block_hit();
                        }
                    }
                    func_worker_anim_atk(argument0);//anim
                }
            }
            break;
    }
}
