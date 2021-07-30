///func_tool_upgrade_requirements(id);
//identify tool requirements for being upgraded.
if(argument0<ds_list_size(global.tool_upgrade_requirement)){
    return global.tool_upgrade_requirement[|argument0];
}
else{
    return -1;
}
