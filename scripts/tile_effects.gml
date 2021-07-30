///tile_effects(x,y,dmg,cx,cy);
if(abs(argument2)>=99999){
    //dmg objects
    func_object_free(cx,cy,n0);
    //dmg worker
    for(w=n3;w>=n0;w--){
        if(global.work_db[w]>-n1){
            if(global.work_x[w]==argument3 && global.work_y==argument4){
                global.work_hp[w] = global.work_hp - n5*n2*n2;
            }
        }
    }
    //effects
    instance_create(argument0,argument1,effect_tnt);
}
else{
    var _effectSpr = global.tile_1[abs(argument2)];
    var _effect = instance_create(argument0,argument1,effect_block_destroy);
    _effect.spr = _effectSpr;
}
