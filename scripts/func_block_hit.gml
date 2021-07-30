///func_block_hit(x,y,dmg,attacker);
//hit a block
var _blockDestroyed = n0;
var _oldBlock = func_map_read(argument0,argument1);
if(_oldBlock > -n1){
    //hit
    func_map_dmg_write(argument0,argument1,func_map_dmg_read(argument0,argument1) + argument2);
    //if block dmg reaches max hp (destroy)
    if(func_map_dmg_read(argument0,argument1)>=func_block_health(_oldBlock)){
        //free block
        var _newBlock = global.map_default_block;
        if(!is_undefined(global.block_change[|_oldBlock])){
            _newBlock = global.block_change[|_oldBlock];
        }func_map_write(argument0,argument1,_newBlock);
        func_map_dmg_write(argument0,argument1,-_oldBlock); // i- number means play effects 
        global.result_destroyed_blocks++;//count destroyed blocks
        //find attacker
        switch(argument3){
            case "worker":
                var gotItem = func_block_item_drops(_oldBlock);//get item
                func_xp_gain(n0,_oldBlock);//get xp
                if(gotItem>-n1){
                    func_game_result_add(gotItem);//add to result
                    //quest
                    quest_watcher(ACTION_ITEM_DROP,gotItem,global._itemDropAmount,-n1);
                }
                //quest
                quest_watcher(ACTION_BLOCK_FREE,_oldBlock,-n1,-n1);
                //fx
                func_sound_block_destroy();
                break;
        }
    _blockDestroyed = n1;}
}
return _blockDestroyed;
