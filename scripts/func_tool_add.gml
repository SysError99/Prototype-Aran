///func_tool_add(id);
if(argument0>-n1){
    var newItem = ds_map_create();//create item data
    ds_list_add(global.tool, newItem);//add to list
    //details
    ds_map_add(newItem,ID,argument0);
    ds_map_add(newItem,EXP,n0);
    ds_map_add(newItem,LV,n1);
    ds_map_add(newItem,SLV,n1);
    ds_map_add(newItem,TOOL,-n1);
    var i = ds_list_find_index(global.tool, newItem);//find position of new data
    //quest
    quest_watcher(ACTION_TOOL_ADD,argument0,-n1,-n1);
    return i;
}else{
    return -n1;
}
