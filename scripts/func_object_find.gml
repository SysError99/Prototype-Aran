///func_object_find(x,y);
//find_instanced_object
if(argument0>=n0 && argument1>=n0 && argument0 < 192 && argument1 < 192){
    if(!instance_exists(global.map_obj [argument0,argument1])) {global.map_obj [argument0,argument1] = -n1;}
    return global.map_obj [argument0,argument1];
}
else{return -n1;}
