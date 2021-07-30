///func_plant_item_drops();
func_item_add(global.plant_grows[#pid, PLANT_SEED],n1); //give seeds
//noti
global.noti_item_drop_id = global.plant_grows[#pid, PLANT_SEED];
global._itemDropAmount = n1;
if(state>=n4){//if state is max, give product item
    func_item_add(global.plant_grows[#pid, PLANT_PRODUCT],global.plant_grows[#pid, PLANT_AMOUNT]);
    //noti
    global.noti_item_drop_id = global.plant_grows[#pid, PLANT_PRODUCT];
    global._itemDropAmount = global.plant_grows[#pid, PLANT_AMOUNT];
}
func_game_result_add(global.plant_grows[#pid, PLANT_PRODUCT]);
