///func_worker_add_lv(workerid, exp, lv);
var _XP = ds_map_find_value(global.work[|argument0],EXP) + argument1; //GAIN
var _LV = ds_map_find_value(global.work[|argument0],LV) + argument2;
while(_XP > _LV*n5*n5*n2){//50
    _XP = _XP - _LV*n5*n2*n5;//50
    _LV = _LV + n1;
}
//cap worker xp & lv
if(_LV>(n9+n2)*n9) {_XP=n5*n2*n5*n5*n2*n5*n2;}//5000
_LV = clamp(_LV,n1,n5*n2*n2*n5);//100
//update
ds_map_replace(global.work[|argument0],EXP, _XP);
ds_map_replace(global.work[|argument0],LV,  _LV);
