///func_worker_pick(worknum);
var workerPickX = global.work_x[argument0];
var workerPickY = global.work_y[argument0];
switch(global.work_a[argument0]){
    case 0: workerPickX++; break;
    case 1: workerPickY--; break;
    case 2: workerPickX--; break;
    case 3: workerPickY++; break;
}
//block pick
var blockPickID = func_map_read(workerPickX, workerPickY);
var blockPickItem = ds_list_find_index(global.block_item_pick,blockPickID);
if(blockPickItem > -n1){
    //block change
    if(!is_undefined(ds_list_find_value(global.block_change,blockPickID))){
        func_map_write(workerPickX,workerPickY,ds_list_find_value(global.block_change,blockPickID));
    }
    else{
        func_map_write(workerPickX,workerPickY,global.map_default_block);
    }
    func_item_add(blockPickItem, n1);
    global.noti_item_drop_id = blockPickItem ;
    global._itemDropAmount = n1;
}
else{
    var objPick = func_object_find(workerPickX,workerPickY);
    if(objPick > -n1){
        with(objPick){
            var objPickFree = n0;
            //item pick
            if(object==n0){
                func_item_add(item, n1);
                global.noti_item_drop_id = item;
                global._itemDropAmount = n1;
                objPickFree = n1;
            }
            //plant pick
            else if(object==n4){
                if(state==n4){//ready to pick up
                    func_plant_item_drops();//drop item
                    quest_watcher(ACTION_ITEM_ADD,pid,global.plant_grows[#pid,PLANT_AMOUNT],-n1);//quest
                    if(global.plant_grows[#pid,PLANT_GROUND]<n0){
                        //permanent plant
                        state=n2;
                    }
                    else{
                        //one-time-harvest plant
                        objPickFree = n1;
                    }
                }
            }
            //obj pick
            else {
                var objPickItem = ds_list_find_index(global.obj_item_pick,object);
                if(objPickItem > -n1){
                    func_item_add(objPickItem, n1);
                    global.noti_item_drop_id = objPickItem;
                    global._itemDropAmount = n1;
                    objPickFree = n1;
                }
            }
            //free object
            if(objPickFree==n1) {ohp=n0; consume=n1;}
        }
    }
}
