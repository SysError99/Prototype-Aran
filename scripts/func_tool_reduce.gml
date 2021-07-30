///func_tool_reduce(id);
//reduce selected too
if(ds_exists(global.tool[|argument0],ds_type_map)){
    var _toolToReduce = global.tool[|argument0];
    //quest
    quest_watcher(ACTION_TOOL_REDUCE,_toolToReduce[?ID],-toolToReduce[?LV],toolToReduce[?SLV]);
    //delete
    ds_map_destroy(_toolToReduce);
    ds_list_delete(global.tool,argument0);
}
