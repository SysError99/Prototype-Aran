///map_init();
//create map
global.map_default_block=n0;//block to replace when something on the map get destroyed.
global.map_default_home_floor=n8;//default home floor block
ds_grid_set_region(global.map,n0,n0,191,191,global.map_default_block);
ds_grid_set_region(global.map_dmg,n0,n0,191,191,n0);
//map_obj (data grid for collision)
var i = 191;
var j = 191;
while(j>=0){
    while(i>=0){
        global.map_obj [i,j] = -n1;
    i--;}
j--;}
global.map_underground = n0;
//initialize map parts
global.work_spawn_x=n0;
global.work_spawn_y=n0;
switch(global.map_file){
    case "minetest": func_gen_forest(); break;//default forest
    case "cave": 
        func_gen_cave();
        global.map_underground = n1;
        break;//default cave
    case "home": //load home
        global.map_default_block = func_worker_set(n1,n3,n2,n5,n4,n6,n0,n8,n7,n9);
        //blocks
        load_data("homedata");
        if(global.file_str!=""){
            //load home
            func_home("load");
            load_data("homedata_obj");
            func_home_obj("load");
            //skip 2 days
            repeat(n3){func_tomorrow();}
        }
        else{
            //new home
            func_gen_forest();
        }
        break;
    case "ruins": func_gen_ruins(); break;
}
//clean 4 blocks for workers
ds_grid_set_region(global.map,global.work_spawn_x+n1,global.work_spawn_y+n1,global.work_spawn_x+n2,global.work_spawn_y+n2,global.map_default_block);
//set worker position
for(w=n0;w<=n3;w++){
    if(global.work_db[w] > -n1){
        func_worker_set_pos(w,global.work_spawn_x,global.work_spawn_y);
    }
}
