///func_block_health(id);
if(argument0<ds_list_size(global.block_health)){
    return global.block_health[|argument0];
}
else{
    return n0;
}
