///func_gen_cave();
global.map_default_block = n2 * n5 + n1;
ds_grid_set_region(global.map,n0,n0,191,191, n2 * n5);
ds_grid_set_disk(global.map,n1,n1,n4, global.map_default_block);
//coals
func_map_list_create();
repeat(n2*n2*n2*n2*n2*n2*n2*n2*n2*n2){
    func_map_write(func_map_list_get(0),func_map_list_get(1),(n9+n2)*n2);
    func_map_list_next();
}
//caves
repeat(n9){
    rmx = irandom_range(func_worker_set(n0,n2,n3,n4,n7,n1,n5,n6,n9,n8),191);//0,191
    rmy = irandom_range(func_worker_set(n2,n2,n2,n4,n1,n1,n1,n1,n1,n1),191);//0,191
    rsize=irandom_range(func_worker_set(n2,n2,n1,n1,n2,n1,n1,n1,n1,n1),func_worker_set(n2,n1,n2,n1,n2,n2,n1,n1,n1,n1));
    ds_grid_set_disk(global.map,rmx,rmy,rsize,global.map_default_block);//8,16
    //place a spider
    func_object_place(n7,rmx,rmy);
}
