///func_item_add(id,amount);
if(argument0>-n1 && argument1>n0){
    if(is_undefined(global.item[|argument0])){
        //new item
        global.item[|argument0] = argument1;
    }
    else{
        //add item
        global.item[|argument0] = global.item[|argument0]+argument1;
    }
    //quest
    quest_watcher(ACTION_ITEM_ADD,argument0,argument1,-n1);
}
