///quest_reward(questname);
//open
var _questReward = ds_map_create();
ds_map_read(_questReward, base64_decode(func_data(n1,global.quest_rewards)))
//reward
switch(_questReward[?argument0+"_type"]){
    case 0: //item
        func_item_add(_questReward[?argument0+"_id"],_questReward[?argument0+"_count"]);
        break;
    case 1: //tool
        func_tool_add(_questReward[?argument0+"_id"]);
        break;
    case 2: //worker
        func_worker_add(_questReward[?argument0+"_id"]);
        break;
    case 3: //rank_xp
        func_rank_xp(_questReward[?argument0+"_count"]);
        break;
    case 4: //rp
        global.data[?RP] = global.data[?RP] + _questReward[?argument0+"_count"];
        break;
    case 5: //gp
        func_gp(GP_CMD_ADD,_questReward[?argument0+"_count"],argument0);
        break;
}
//close
ds_map_destroy(_questReward);


