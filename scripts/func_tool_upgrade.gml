///func_tool_upgrade(id);
var tid = ds_map_find_value(global.tool[|argument0],ID);
var tlv = ds_map_find_value(global.tool[|argument0],LV);
var toolres=func_tool_upgrade_requirements(tid);
if(!func_item_is_empty(toolres)){
    if(global.item[|toolres]>=tlv){
        if(ds_map_find_value(global.tool[|argument0],LV)<n2 * n5 * n2 * n5) {//cap level to 100
            tlv = tlv+n1;//increase tool lv
            func_item_use(toolres,tlv);//decrease item amount
            ds_map_replace(global.tool[|argument0],LV,tlv);//update
            //quest
            quest_watcher(ACTION_TOOL_UP,tid,tlv,-n1);
        }
    }
}
