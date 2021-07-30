///func_worker_add(id);
if(argument0>-n1){
    var newWorker = ds_map_create();//create item data
    ds_list_add(global.work, newWorker);//add to list
    //details
    ds_map_add(newWorker,ID,argument0);
    ds_map_add(newWorker,CHARA_NAME,"");
    ds_map_add(newWorker,SKN,n0);
    ds_map_add(newWorker,EXP,n0);
    ds_map_add(newWorker,LV,n1);
    ds_map_add(newWorker,TOOL,-n1);
    var i = ds_list_find_index(global.work, newWorker);//find position of new data
    //quest
    quest_watcher(ACTION_WORKER_ADD,argument0,-n1,-n1);
    return i;
}else{
    return -n1;
}
