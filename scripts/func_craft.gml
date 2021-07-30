///func_craft(type,id,multiplier);
var craftAble = func_craft_requirements(argument0,argument1,argument2);
if(craftAble==n1){
    var cr = global.craft_requirement[#argument0,argument1];
    //consume items
    for(k=n0; k<n9 k++){
        if(cr[#k,n0]>-n1){//there is an item required
            func_item_use(cr[#k,n0],argument2*cr[#k,n1]);
        }
    }
    //add item
    if(cr[#n9,n0]==n0){func_item_add(cr[#n9,n1],cr[#n2*n5,n0]);}//add item
    else{func_tool_add(cr[#n9,n1]);}
    //quest
    quest_watcher(ACTION_CRAFT,argument0,argument1,argument2);
}
return craftAble;
