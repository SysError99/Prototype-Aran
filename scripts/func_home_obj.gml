///func_home_obj(mode);
//load objects from global.file_str (json)
var _homeObjTxt = "";
if(argument0=="save"){
    global.home_obj_write = ds_list_create();
    if(instance_exists(obj_task)){with(obj_task){
        var o = ds_list_create();
        //core vars
        o[|n0] = object;
        o[|n1] = ohp;
        o[|n2] = omhp;
        o[|n3] = ox;
        o[|n4] = oy;
        o[|n5] = col;
        //purpose-dependence vars
        switch(object){
            case 0: //item
                o[|n6] = item;
                break;
            case 1: //smelter
                //6, 7 is empty now
                o[|n8] = coals;
                break;
            case 4: //plant
                o[|n6] = pid;
                o[|n7] = day;
                o[|n8] = growday;
                o[|n9] = state;
                break;
        }
        //write
        ds_list_add(global.home_obj_write,ds_list_write(o)); ds_list_destroy(o);
    }}
    //write all
    _homeObjTxt = func_data(n0,base64_encode(ds_list_write(global.home_obj_write)));
}
else{
    //read all
    global.home_obj_read = ds_list_create(); ds_list_read(global.home_obj_read, base64_decode(func_data(n1,global.file_str)));
    while(!ds_list_empty(global.home_obj_read)){
        //read
        var o = ds_list_create(); ds_list_read(o,global.home_obj_read[|n0]);
        //core vars
        var obj = func_object_place(o[|n0],o[|n3],o[|n4]);
            obj.hp = o[|n1];
            obj.omhp=o[|n2];
            obj.col= o[|n5];
        //purpose-dependence vars
        switch(obj.object){
            case 0: //item
                obj.item = o[|n6];
                break;
            case 1: //smelter
                //6, 7 is empty now
                obj.coals=o[|n8];
                break;
            case 4: //plant
                obj.pid = o[|n6];
                obj.day = o[|n7];
                obj.growday = o[|n8];
                obj.state=o[|n9]
                break;
        }
        //close
        ds_list_destroy(o);
        //delete
        ds_list_delete(global.home_obj_read,n0);
    }
    //close all
    ds_list_destroy(global.home_obj_read);
}
return _homeObjTxt;
