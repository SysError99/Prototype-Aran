///func_gacha();
var _gacha = irandom_range(n0,(n9+n2)*n9);
//open
var _gachaDb = ds_list_create(); ds_list_read(_gachaDb, base64_decode(func_data(n1,global.gacha_table)));
//get id
_gacha = _gachaDb[|_gacha];
//exist character
var i = n0; var _found = n0; while(i < ds_list_size(global.work) && _found == n0){
    if(ds_map_find_value(global.work[|i],ID) == _gacha){
        //existing character
        func_worker_add_lv(i,n0,n1);
    _found = n1;}
i++;}
//new character
if(_found==n0){
    func_worker_add(_gacha);
}
//close
return _gacha;
