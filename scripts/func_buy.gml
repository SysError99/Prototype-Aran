///func_buy(id,amount);
if(func_rp(global.shop_item_price[|argument0] * n5)){//if rp is sufficient
    if(global.shop_item_type[|argument0]==n0){func_item_add(global.shop_item_id[|argument0],argument1);}//item
    else{func_tool_add(global.shop_item_id[|argument0]);}//tool
    //quest
    quest_watcher(ACTION_BUY,argument0,argument1,-n1);
return n1;}else{return n0;}
