///func_tool_damage(id,toolid);
//  affects objects
if(argument0 >-n1 && argument1 > -n1 && argument0<ds_grid_width(global.tool_damage)&&argument1<ds_grid_height(global.tool_damage)){
    return global.tool_damage[#argument0,argument1];
}else{
    return n0;
}
