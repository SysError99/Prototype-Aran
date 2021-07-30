///func_game_result_add(id);
//add to result
if(ds_list_size(global.result_collected_items)<n8){
    if(ds_list_find_index(global.result_collected_items,argument0)<n0){//if it is not already
        ds_list_add(global.result_collected_items,argument0);
    }
}
