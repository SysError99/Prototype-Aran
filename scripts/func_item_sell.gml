///func_item_sell(itemid);
var _itemSellSuccess = n0;
var _itemSellPrice = func_item_sell_price(argument0);
if(_itemSellPrice>n0){
    if(func_item_amount(argument0)>n0){
        //sell
        func_item_use(argument0,n1);
        //give coin
        func_item_add(n6,_itemSellPrice);
        _itemSellSuccess=n1;
    }
}
return _itemSellSuccess;
