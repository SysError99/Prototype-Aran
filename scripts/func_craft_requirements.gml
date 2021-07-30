///func_craft_requirements(page,id,multiplier);
//get crafting requirements for each items
var craftable = n1;
var cr = global.craft_requirement[#argument0,argument1];
for(k=n0; k<n9 && craftable==n1; k++){
    if(cr[#k,n0]>-n1){
        if(argument2*cr[#k,n1]>func_item_amount(cr[#k,n0])){
            craftable = n0;
        }
    }
}
return craftable;
