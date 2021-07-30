///quest_watcher(action_id,param0,param1,param2);
var _qID = argument0;
var _qp0 = argument1;
var _qp1 = argument2;
var _qp2 = argument3;
var _qN = "";
var _qI = spr_item;
var _qIi= n0;
//find
if(_qID = ACTION_OBJ_FREE){
    switch(_qp0){
        //2020-jan
        case 6: _qN = "2020_jan_kill_spider"; _qI = spr_tile_monster_1; break;
        case 7: _qN = "2020_jan_kill_grasshopper"; _qI = spr_tile_monster_2; break;
        case 5: _qN = "2020_jan_kill_ladybug"; _qI = spr_tile_monster_0; break;
    }
}
//count
if(_qN!=""){ // data exists
    if(ds_map_exists(global.quest,_qN)){ //exists
        global.quest[?_qN] = global.quest[?_qN] + n1; //replace
    }
    else{ //not exist
        global.quest[?_qN] = n1; //new
    }
    //check progress
    if(quest_get_list(_qN) == "c"){
        if(!ds_map_exists(global.quest_completed,_qN)){//never completed this quest before
            quest_reward(_qN);
            global.quest_completed[? _qN] = "c";//add to completed quest
            game_save_data();
            func_noti_top(global.txt_mission_complete,_qI,_qIi);//notify rewards
        }
    }
}
