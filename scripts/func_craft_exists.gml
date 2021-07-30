///func_craft_exists(page,n);
if(is_undefined(global.craft_requirement[#argument0,argument1])){
    return n0;
}
else if(global.craft_requirement[#argument0,argument1]==-n1){
    return n0;
}
else if(!ds_exists(global.craft_requirement[#argument0,argument1],ds_type_grid)){
    return n0;
}
else{
    return n1;
}
