///func_gameplay_end();
//summarise game results
//results
var rpEarned = round((n4*global.result_created_blocks) + (n3*global.result_destroyed_blocks) + (0.1*global.result_unit_moves));//earning resource points
//make summary
global.result_message = global.txt_result+RETURN;
if(global.data[?RANK]>global.result_old_rank){//if rank up
    global.result_message = global.result_message + global.txt_result_rank+string(global.result_old_rank)+" >> "+string(global.data[?RANK])+" ";
}
global.result_message = global.result_message + "(+"+string(rpEarned)+" RP)"+RETURN+global.txt_result_collected_items;
//get RP
global.data[?RP] = global.data[?RP] + rpEarned;
