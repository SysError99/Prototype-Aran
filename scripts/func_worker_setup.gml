///func_worker_setup();
// -- initialize worker variables --
//shared variables
if(global.map_file==""){
    //worker options
    global.current_item=n0;
    //worker shared vars
    global.work_px = n0;
    global.work_py = n0;
    //in-game notification
    global.noti_item_drop_id = -n1;
}
//worker stats & position
for(w=n3;w>=n0;w--){
    global.work_db[w] = global.team[#global.map_team,w];
    if(global.work_db[w] > -n1){//worker exists
        //only set when start game
        if(global.map_file == ""){
            //chosen worker
            global.current_work=w;
            //worker_stats
            global.work_lv [w] = ds_map_find_value(global.work[|global.work_db[w]],LV);
            global.work_hp [w] = func_worker_set(n1,n1,n1,n4,n5,n5,n1,n1,n1,n1);//100
            global.work_sp [w] = func_worker_set(n4,n2,n1,n1,n5,n5,n5,n1,n1,n1) + floor(global.work_lv[w] * n2*n5);//1000,10
            global.work_msp[w] = global.work_sp[w];
            global.work_job[w] = n0;
            global.work_at [w] = n0; //auto
            //worker anim
            global.work_walk_frame [w] = n1;
            //note: position is set on map_init()
        }
        //get-tool-stats
        var workTool = ds_map_find_value(global.work[|global.work_db[w]],TOOL);
        var tID = -n1;
        var tLV = n0;
        var tSLV= n0;
        if(workTool>-n1){//delect tool
            tID = ds_map_find_value(global.tool[|workTool],ID);
            tLV = ds_map_find_value(global.tool[|workTool],LV);
            tSLV= ds_map_find_value(global.tool[|workTool],SLV);
        }
        ///set-tool-stats
        global.work_tool_id [w] = tID;
        global.work_tool_lv [w] = tLV;
        global.work_tool_slv[w] = tSLV;
    }
}
