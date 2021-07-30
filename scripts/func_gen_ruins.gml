///func_gen_ruins();
//generate ruined city
func_gen_forest();
//ruined buidings
var ruined_building_x = ds_queue_create(); var ruined_building_y = ds_queue_create() ruined_building_size = ds_queue_create(); var rsize=n0;
repeat(irandom_range(n4,n8)){//brick
    rmx = irandom_range(func_worker_set(n2,n2,n2,n4,n1,n1,n1,n1,n1,n1),191);//32,191
    rmy = irandom_range(func_worker_set(n2,n2,n2,n4,n1,n1,n1,n1,n1,n1),191);//32,191
    rsize=irandom_range(func_worker_set(n2,n3,n1,n1,n1,n1,n1,n1,n1,n1),func_worker_set(n1,n1,n2,n1,n3,n3,n1,n1,n1,n1));
    ds_grid_set_disk(global.map,rmx,rmy,rsize,n9+n1);//6,18
    //save for lake spots
    ds_queue_enqueue(ruined_building_x, rmx);
    ds_queue_enqueue(ruined_building_y, rmy);
    ds_queue_enqueue(ruined_building_size, rsize);
}
repeat(ds_queue_size(ruined_building_x)){//inside
    //floor
    rmx = ds_queue_dequeue(ruined_building_x);
    rmy = ds_queue_dequeue(ruined_building_y);
    rsize=ds_queue_dequeue(ruined_building_size);
    ds_grid_set_disk(global.map,rmx,rmy,rsize-n1,n9+n2);
    //sand
    repeat(irandom_range(n2,n3)){
        var rdsX = rmx + irandom_range(floor(-rsize*0.5),floor(rsize*0.5));
        var rdsY = rmy + irandom_range(floor(-rsize*0.5),floor(rsize*0.5));
        ds_grid_set_disk(global.map,rdsX,rdsY,n3,n6*n2);
        func_item_place((n5*n2*n5)+n5,rdsX,rdsY);//spawn gunpowder
    }
    //pole
    repeat(irandom_range(n9,n3*n2*n2)){
        var rdsX = rmx + irandom_range(-rsize,rsize);
        var rdsY = rmy + irandom_range(-rsize,rsize);
        func_map_write(rdsX,rdsY, n7);
    }
}
ds_queue_destroy(ruined_building_x); ds_queue_destroy(ruined_building_y); ds_queue_destroy(ruined_building_size);
