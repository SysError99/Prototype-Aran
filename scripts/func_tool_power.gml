///func_tool_power(blockid,toolid);
//  affects blocks
if(argument0 >=n0 && argument1 >= n0 && argument0<ds_grid_width(global.tool_power) && argument1<ds_grid_height(global.tool_power)){
    return global.tool_power[#argument0,argument1];
}else{return n0;}
