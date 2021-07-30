///func_map_read(x,y);
//read map coordinates safely
if(func_map_verify(argument0,argument1)==n1){
    return global.map[#argument0,argument1];
}
else{return -n1;}
