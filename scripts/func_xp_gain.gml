///func_xp_gain(type,id);
var currentwork = global.team[#global.map_team,global.current_work];
var _workXP = n0;
//EXP_Amount
if(argument0==n0){//block
    if(argument1<ds_list_size(global.block_xp) && !is_undefined(global.block_xp[|argument1])){
        _workXP = global.block_xp[|argument1];
    }
}
//object
else if(argument0==n1){//object
    if(argument1<ds_list_size(global.obj_xp) && !is_undefined(global.object_xp[|argument1])){
        _workXP = global.obj_xp[|argument1];
    }
}
var _masterXP = _workXP * (n3 / (n2*n2));
//workerXP
func_worker_add_lv(currentwork, _workXP, n0);
//masterLV_UP
func_rank_xp(_masterXP);
