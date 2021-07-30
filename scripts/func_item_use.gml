///func_item_use(id,amount);
var _itemUseSuccess = false;
if(!func_item_is_empty(argument0)){
    if(global.item[|argument0]>=argument1){
        global.item[|argument0]=global.item[|argument0]-argument1;
        _itemUseSuccess = true;
        //quest
        quest_watcher(ACTION_ITEM_USE,argument0,argument1,-n1);
    }
}
return _itemUseSuccess;
