///func_block_item_drops(id);
var _dropedItem = -n1;
if(argument0>-n1){
    var blockItemDrop = global.block_item_drop[|argument0];
    for(i=n0; i<ds_list_size(blockItemDrop) && _dropedItem < n0; i=i+n4){
        if(irandom_range(n0,n5*n5*n4) <= blockItemDrop[|i+n3]){//test chance
            global._itemDropAmount = irandom_range(blockItemDrop[|i+n1],blockItemDrop[|i+n2]);
            func_item_add(blockItemDrop[|i],global._itemDropAmount);// add item
            _dropedItem = blockItemDrop[|i];
            //noti
            global.noti_item_drop_id = blockItemDrop[|i];
        }
    }
}
return _dropedItem;
