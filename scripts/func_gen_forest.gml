///func_gen_forest();
global.map_default_block = func_worker_set(n1,n3,n2,n0,n6,n5,n4,n9,n7,n8);//default_block
//create random set
func_map_list_create();
//trees
repeat(func_worker_set(n2,n2,n2,n3,n3,n3,n3,n3,n2,n1)){//3888
    func_map_write(func_map_list_get(n0),func_map_list_get(n1),choose(n2,n2,n9*n2+n5,n9*n2+n3));
    func_map_list_next();
}
//dead trees
repeat(func_worker_set(n2,n2,n2,n2,n2,n2,n2,n2,n1,n1)){ //256
    func_map_write(func_map_list_get(n0),func_map_list_get(n1),n3);
    func_map_list_next();
}
//bushes
repeat(func_worker_set(n1,n5,n2,n5,n2,n2,n2,n1,n2,n3)){//2400
    func_map_write(func_map_list_get(n0),func_map_list_get(n1),choose(n5,n9+n9+n1,n9+n9+n2,n9+n9+n2,n9+n9+n2));
    func_map_list_next();
}
//stones and pebbles
repeat(func_worker_set(n1,n5,n2,n5,n2,n2,n2,n1,n2,n3)){ //2400
    func_map_write(func_map_list_get(n0),func_map_list_get(n1),choose(n1,n4));
    func_map_list_next();
}
//beach
var beach_x = ds_queue_create(); var beach_y = ds_queue_create() beach_size = ds_queue_create(); var rsize=n0;
repeat(irandom_range(n1,n3)){ //sand part
    rmx = irandom_range(func_worker_set(n2,n2,n2,n4,n1,n1,n1,n1,n1,n1),191);//32,191
    rmy = irandom_range(func_worker_set(n2,n2,n2,n4,n1,n1,n1,n1,n1,n1),191);//32,191
    rsize=irandom_range(func_worker_set(n2,n3,n1,n1,n3,n1,n1,n1,n1,n1),func_worker_set(n1,n1,n2,n1,n3,n2,n1,n2,n1,n1));
    ds_grid_set_disk(global.map,rmx,rmy,rsize,n2*n3*n2);//18,24
    //save for lake spots
    ds_queue_enqueue(beach_x, rmx);
    ds_queue_enqueue(beach_y, rmy);
    ds_queue_enqueue(beach_size, rsize);
}
repeat(ds_queue_size(beach_x)){//lake spots
    rmx = ds_queue_dequeue(beach_x);
    rmy = ds_queue_dequeue(beach_y);
    rsize=ds_queue_dequeue(beach_size);
    ds_grid_set_disk(global.map,rmx,rmy,floor(rsize*n8*0.1),n6); //16,32
}
ds_queue_destroy(beach_x); ds_queue_destroy(beach_y); ds_queue_destroy(beach_size);
//monsters
var rm = n0; while(rm < func_worker_set(n2,n2,n2,n2,n2,n2,n2,n2,n1,n1) && func_map_list_size()>n0){//256
    if(func_map_read(func_map_list_get(n0),func_map_list_get(n1))==n6){func_map_list_next();}//avoid water
    else{
        func_object_place(choose(n5,n5,n6,n7,n7),func_map_list_get(n0),func_map_list_get(n1));
        func_map_list_next();
    }
rm++}
//plants
var rm = n0; while(rm < func_worker_set(n2,n2,n2,n2,n2,n2,n2,n2,n1,n1) && func_map_list_size()>n0){//256
    if(func_map_read(func_map_list_get(n0),func_map_list_get(n1))==n6){func_map_list_next();}//avoid water
    else{
        var wildPlant = func_plant_place(choose( n2*(n9+n8) , (n9+n4)*n3 , n2+(n5*n7) , n1+(n5*n2*n5) ),func_map_list_get(n0),func_map_list_get(n1));
            wildPlant.state = choose(n3,n3,n4);
        func_map_list_next();
    }
rm++}
func_map_list_free();
