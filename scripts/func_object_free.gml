///func_object_free(x,y,consume?);
//free (delete) object from the field
var _objFree = func_object_find(argument0,argument1);
if(_objFree > -n1){
    with(_objFree){
        consume = argument2;
        ohp = -n1;
    }
}
