///quest_init();
//initialize quest parameters
//quest reset (monthly)
if(global.data[?MONTH] != current_month){
    //all
    ds_map_destroy(global.quest); ds_map_destroy(global.quest_completed);
    global.quest = ds_map_create(); global.quest_completed = ds_map_create();
    game_save_data();
    //set new month
    global.data[?MONTH] = current_month;
}
//2020_jan
var newQuest = ds_list_create();
ds_list_add(newQuest,"2020_jan_kill_spider");
ds_list_add(newQuest,"2020_jan_kill_grasshopper");
ds_list_add(newQuest,"2020_jan_kill_ladybug");
//add
while(!ds_list_empty(newQuest)){
    if(!ds_map_exists(global.quest,newQuest[|n0])){
        ds_map_add(global.quest,newQuest[|n0],n0);
    }
    ds_list_delete(newQuest,n0);
}ds_list_destroy(newQuest);
