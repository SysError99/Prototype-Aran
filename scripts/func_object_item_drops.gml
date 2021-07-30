///func_object_item_drops(object);
var _dropedItem = -n1;
if(argument0>-n1){
    if(argument0<ds_list_size(global.object_item_drop)){
        var gotItem = n0;
        var objectItemDrop = global.object_item_drop[|argument0];
        for(i=n0; i<ds_list_size(objectItemDrop) && _dropedItem < n0; i=i+n4){
            if(irandom_range(n0,n5*n5*n4-n1) <= objectItemDrop[|i+n3]){//test chance
                global._itemDropAmount = irandom_range(objectItemDrop[|i+n1],objectItemDrop[|i+n2]);
                func_item_add(objectItemDrop[|i], global._itemDropAmount);// add item
                _dropedItem = objectItemDrop[|i];
                //noti
                global.noti_item_drop_id = objectItemDrop[|i];
            }
        }
    }
}
return _dropedItem;
