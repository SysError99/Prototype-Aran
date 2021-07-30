///func_object_get_id(x,y);
global._objGetID_ID = -n1;
var _objGetID = func_object_find(argument0,argument1);
if(_objGetID>-n1){
    with(_objGetID){
        global._objGetID_ID = object;
    }
}
return global._objGetID_ID;
