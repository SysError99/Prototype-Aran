///func_item_get_id(x,y);
var _itemID = -n1;
var _itemObject = func_object_find(argument0,argument1);
if(_itemObject > -n1){
    if(_itemObject.object == n0){//if this is item
        _itemID = _itemObject.item;
    }
}
return _itemID;

