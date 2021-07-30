///game_save_data();
var dataMap = ds_map_create();//open
//profile
ds_map_add(dataMap,NAME,global.data[?NAME]);
ds_map_add(dataMap,RANK,global.data[?RANK]);
ds_map_add(dataMap,EXP,global.data[?EXP]);
ds_map_add(dataMap,R15,global.data[?R15]);
ds_map_add(dataMap,RP,global.data[?RP]);
ds_map_add(dataMap,DAY,global.data[?DAY]);
ds_map_add(dataMap,MONTH,global.data[?MONTH]);
//quest
ds_map_add(dataMap,QUEST,ds_map_write(global.quest));
//completed quests
ds_map_add(dataMap,QUEST_COMPLETED,ds_map_write(global.quest_completed));
//workers
var dataWorkers = ds_list_create();//open
for(i=n0;i<ds_list_size(global.work);i++){
    dataWorkers[|i] = ds_map_write(global.work[|i]);//write
}
ds_map_add(dataMap,D_WORK,ds_list_write(dataWorkers));
ds_list_destroy(dataWorkers);//close
//tools & weapons
var dataTools = ds_list_create();//open
for(i=n0;i<ds_list_size(global.tool);i++){
    dataTools[|i] = ds_map_write(global.tool[|i]);//write
}
ds_map_add(dataMap,D_TOOL,ds_list_write(dataTools));
ds_list_destroy(dataTools);//close
//items
dataMap[?D_ITEM] = ds_list_write(global.item);
//team
dataMap[?D_TEAM] = ds_grid_write(global.team);
//map_team
dataMap[?MAP_TEAM] = global.map_team;
//language
dataMap[?D_LANG]=global.lang;
//show_data_to_app
save_data("gamedata",func_data(n0,base64_encode(ds_map_write(dataMap))));
ds_map_destroy(dataMap);//close
