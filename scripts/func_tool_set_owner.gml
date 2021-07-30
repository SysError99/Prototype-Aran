///func_tool_set_owner(toolid,worker);
var oldOwner = ds_map_find_value(global.tool[|argument0],TOOL);//get old owner position
ds_map_replace(global.tool[|argument0],TOOL,argument1);//set new ownership
if(oldOwner>-n1) {ds_map_replace(global.work[|oldOwner],TOOL, -n1);} //remove old owner
ds_map_replace(global.work[|argument1],TOOL,argument0);//set new owner
