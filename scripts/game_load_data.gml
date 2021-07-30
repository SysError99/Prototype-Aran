///game_load_data();
//read
var dataMap = ds_map_create();
if(global.file_str!="") {
    global.file_str=base64_decode(func_data(n1,global.file_str));
    ds_map_read(dataMap,global.file_str);//open
}
//temp_vars
var _data="";
var _ndata=0;
//profile
global.data = ds_map_create();
if(ds_map_exists(dataMap,NAME)) {_data = dataMap[?NAME]; ds_map_delete(dataMap,NAME);} else {_data = global.temp_player_name;} ds_map_add(global.data,NAME,_data);
if(ds_map_exists(dataMap,RANK)) {_ndata= dataMap[?RANK]; ds_map_delete(dataMap,RANK);} else {_ndata= func_worker_set(n1,n1,n1,n1,n1,n1,n1,n1,n1,n1);} ds_map_add(global.data,RANK,_ndata);
if(ds_map_exists(dataMap,EXP))  {_ndata= dataMap[?EXP];  ds_map_delete(dataMap,EXP);}  else {_ndata= func_worker_set(n3,n1,n4,n6,n3,n6,n2,n1,n2,n0);} ds_map_add(global.data,EXP, _ndata);
if(ds_map_exists(dataMap,R15))  {_ndata= dataMap[?R15];  ds_map_delete(dataMap,R15);}  else {_ndata= func_worker_set(n3,n0,n1,n4,n6,n3,n7,n2,n3,n5);} ds_map_add(global.data,R15, _ndata);
if(ds_map_exists(dataMap,RP))   {_ndata= dataMap[?RP];   ds_map_delete(dataMap,RP);}   else {_ndata= func_worker_set(n2,n1,n1,n2,n1,n5,n1,n1,n5,n3);} ds_map_add(global.data,RP,_ndata);
if(ds_map_exists(dataMap,DAY))  {_ndata= dataMap[?DAY];  ds_map_delete(dataMap,DAY);}  else {_ndata= n1;} ds_map_add(global.data,DAY,_ndata);
if(ds_map_exists(dataMap,MONTH)){_ndata= dataMap[?MONTH];ds_map_delete(dataMap,MONTH);}else {_ndata= n1;} ds_map_add(global.data,MONTH,_ndata);
//quest
global.quest = ds_map_create();
if(ds_map_exists(dataMap,QUEST)){ds_map_read(global.quest,dataMap[?QUEST]); ds_map_delete(dataMap,QUEST);}
//completed_quests
global.quest_completed = ds_map_create();
if(ds_map_exists(dataMap,QUEST_COMPLETED)){ds_map_read(global.quest_completed,dataMap[?QUEST_COMPLETED]); ds_map_delete(dataMap,QUEST_COMPLETED);}
//workers
global.work = ds_list_create();
if(ds_map_exists(dataMap,D_WORK)){
    //saved_workers
    var dataWorkers = ds_list_create();
    ds_list_read(dataWorkers,dataMap[?D_WORK]); ds_map_delete(dataMap,D_WORK);//read data && destroy
    for(i=n0;i<ds_list_size(dataWorkers);i++){//loop find all
        global.work[|i] = ds_map_create();
        ds_map_read(global.work[|i],dataWorkers[|i]);//read
    }
    ds_list_destroy(dataWorkers);//del when finish
}else{
    //new_workers
    func_worker_add(func_worker_set(n2,n1,n3,n5,n1,n2,n3,n5,n3,n0));//worker0: tiger
}
//tools & weapons
global.tool = ds_list_create();
if(ds_map_exists(dataMap,D_TOOL)){
    //saved_tools
    var dataTools = ds_list_create();
    ds_list_read(dataTools,dataMap[?D_TOOL]); ds_map_delete(dataMap,D_TOOL);//read data && destroy
    for(i=n0;i<ds_list_size(dataTools);i++){//loop find all
        global.tool[|i] = ds_map_create();
        ds_map_read(global.tool[|i],dataTools[|i]);//read
    }
    ds_list_destroy(dataTools);//del when finish
}else{
    //new_tools
    var newAxe = func_tool_add(func_worker_set(n1,n1,n1,n1,n1,n1,n1,n1,n1,n1));//tool0: axe
    //add tool to worker
    func_tool_set_owner(newAxe,n0);
}
//items
global.item = ds_list_create();
if(ds_map_exists(dataMap,D_ITEM)) {ds_list_read(global.item,dataMap[?D_ITEM]); ds_map_delete(dataMap,D_ITEM);}//load
else {
    //new_items
    func_item_add(func_worker_set(n2,n1,n3,n5,n1,n0,n3,n5,n3,n0),func_worker_set(n1,n3,n1,n2,n1,n1,n5,n1,n1,n1));
}
//team
global.team = ds_grid_create(n9,n4); ds_grid_set_region(global.team,n0,n0,n8,n3,-n1); //team slot
if(ds_map_exists(dataMap,D_TEAM)) {ds_grid_read(global.team,dataMap[?D_TEAM]); ds_map_delete(dataMap,D_TEAM);}//load
else {
    //new_workers_to_the_team
    global.team[#n0,n0] = n0;
}
//map_team 
if(ds_map_exists(dataMap,MAP_TEAM)) {global.map_team = dataMap[?MAP_TEAM]; ds_map_delete(dataMap,MAP_TEAM);}//load
//lang
if(ds_map_exists(dataMap,D_LANG)) {global.lang = dataMap[?D_LANG]; ds_map_delete(dataMap,D_LANG);}//load
ds_map_destroy(dataMap);//close
