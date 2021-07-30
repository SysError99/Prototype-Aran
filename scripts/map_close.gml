///map_close();
//if this is home, save home
if(global.map_file=="home"){
    //save home
    save_data("homedata",func_home("save"));
    save_data("homedata_obj",func_home_obj("save"));
}
//set map empty
global.map_file="";
