///game_database();
//Decrypt Database
var db = ds_map_create(); ds_map_read(db, base64_decode(func_data(n1,func_file_str("database.txt")))); //open
//block_change
global.block_change = ds_list_create(); ds_list_read(global.block_change, db[?DB_BLOCK_CHANGE]); ds_map_delete(db,DB_BLOCK_CHANGE);
//block item pick
global.block_item_pick = ds_list_create(); ds_list_read(global.block_item_pick, db[?DB_BLOCK_PICK]); ds_map_delete(db,DB_BLOCK_PICK);
//block heath
global.block_health = ds_list_create(); ds_list_read(global.block_health, db[?DB_BLOCK_HEALTH]); ds_map_delete(db,DB_BLOCK_HEALTH);
//block item drops
global.block_item_drop = ds_list_create();
var dataBid = ds_list_create(); ds_list_read(dataBid, db[?DB_BLOCK_ITEM_DROP]); ds_map_delete(db,DB_BLOCK_ITEM_DROP);
for(i=n0; i<ds_list_size(dataBid); i++){
    if(string_length(string(dataBid[|i]))>n2){
        //exists
        global.block_item_drop[|i] = ds_list_create();
        ds_list_read(global.block_item_drop[|i], dataBid[|i]);
    }
    else{
        //not_exist
        global.block_item_drop[|i] = -n1;
    }
}ds_list_destroy(dataBid);
//block xp gain
global.block_xp = ds_list_create(); ds_list_read(global.block_xp,db[?DB_BLOCK_XP]); ds_map_delete(db,DB_BLOCK_XP);
//craft requirements
var dataCr = ds_grid_create(db_craft_pages,n9); ds_grid_read(dataCr, db[?DB_CRAFT_REQUIREMENT]); ds_map_delete(db, DB_CRAFT_REQUIREMENT);
global.craft_requirement = ds_grid_create(ds_grid_width(dataCr),ds_grid_height(dataCr));
for(i=n0; i<ds_grid_width(dataCr); i++){//page
    for(j=n0; j<ds_grid_height(dataCr); j++){//n
        if(string_length(string(dataCr[#i,j]))>n2){
            //exists
            global.craft_requirement[#i,j] = ds_grid_create((n3*n3)+n2,n2);//2,11
            ds_grid_read(global.craft_requirement[#i,j],dataCr[#i,j]);
        }
        else{
            //not_exist
            global.craft_requirement[#i,j] = -n1;
        }
    }
}ds_grid_destroy(dataCr);
global.tool_damage = ds_grid_create(db_objects,db_tools); ds_grid_read(global.tool_damage,db[?DB_TOOL_DMG]); ds_map_delete(db,DB_TOOL_DMG);
//item sell price
global.item_sell_price = ds_list_create(); ds_list_read(global.item_sell_price,db[?DB_ITEM_SELL_PRICE]);
//object item drops
global.object_item_drop = ds_list_create();
var dataOid = ds_list_create(); ds_list_read(dataOid, db[?DB_OBJECT_ITEM_DROP]); ds_map_delete(db,DB_OBJECT_ITEM_DROP);
for(i=n0; i<ds_list_size(dataOid); i++){
    if(string_length(string(dataOid[|i]))>n2){
        //exists
        global.object_item_drop[|i] = ds_list_create();
        ds_list_read(global.object_item_drop[|i],dataOid[|i]);
    }
    else{
        //not_exist
        global.object_item_drop[|i] = -n1;
    }
}ds_list_destroy(dataOid);
//object item pick
global.obj_item_pick = ds_list_create(); ds_list_read(global.obj_item_pick,db[?DB_OBJECT_PICK]); ds_map_delete(db,DB_OBJECT_PICK);
//object xp gain
global.obj_xp = ds_list_create(); ds_list_read(global.obj_xp,db[?DB_OBJECT_XP]); ds_map_delete(db,DB_OBJECT_XP);
//plant grows
global.plant_grows=ds_grid_create(db_plants,db_plant_data); ds_grid_read(global.plant_grows,db[?DB_PLANT_GROWS]); ds_map_delete(db,DB_PLANT_GROWS);
//tool power (affects blocks)
global.tool_power = ds_grid_create(db_blocks,db_tools); ds_grid_read(global.tool_power,db[?DB_TOOL_POWER]); ds_map_delete(db, DB_TOOL_POWER);
//tool upgrade requirements
global.tool_upgrade_requirement = ds_list_create(); ds_list_read(global.tool_upgrade_requirement,db[?DB_TOOL_UPGRADE_REQUIREMENT]);
//shop stuffs
global.shop_item_id = ds_list_create(); ds_list_read(global.shop_item_id,db[?DB_SHOP_ID]); ds_map_delete(db, DB_SHOP_ID);
global.shop_item_type=ds_list_create(); ds_list_read(global.shop_item_type,db[?DB_SHOP_TYPE]); ds_map_delete(db, DB_SHOP_TYPE);
global.shop_item_price=ds_list_create();ds_list_read(global.shop_item_price,db[?DB_SHOP_PRICE]); ds_map_delete(db, DB_SHOP_PRICE);
//gacha table
global.gacha_table = db[?DB_GACHA_TABLE]; ds_map_delete(db,DB_GACHA_TABLE);
//worker star
global.worker_star = ds_list_create(); ds_list_read(global.worker_star, db[?DB_WORKER_STAR]); ds_map_delete(db, DB_WORKER_STAR);
//quest_rewards
global.quest_rewards = db[?DB_QUEST_REWARD]; ds_map_delete(db, DB_QUEST_REWARD)//decipher later
ds_map_destroy(db);//close
