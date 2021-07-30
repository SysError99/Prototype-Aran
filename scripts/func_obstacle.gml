///func_obstacle(x,y);
//if something blocks path
if(func_block_get_collide(argument0,argument1)==n0){
    if(func_object_get_collide(argument0,argument1)==n0){
        if(func_worker_get_collide(argument0,argument1)==n0){
            return n0
        }
        else{
            return n1;
        }
    }
    else{
        return n1;
    }
}else{
    return n1;
}
