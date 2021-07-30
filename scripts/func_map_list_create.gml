///func_map_list_create();
var global.map_coor_list = ds_list_create(); 
var _rsx = n0;
var _rsy = n0;
while(_rsy<192){
    while(_rsx<192){
        var _rsxs = string(_rsx); while(string_length(_rsxs)<3) {_rsxs = "0"+_rsxs;}
        var _rsys = string(_rsy); while(string_length(_rsys)<3) {_rsys = "0"+_rsys;}
        ds_list_add(global.map_coor_list,_rsxs+_rsys);
    _rsx++;}
    _rsx=n0;
    _rsy++;
}
ds_list_shuffle(global.map_coor_list);
