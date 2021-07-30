///func_worker_item_use(worknum, id);
switch(argument1){
    //NRG drink
    case 3:
        if(func_item_use(argument1,n1)){
            instance_create(320,560,effect_player_nrg_drink);
            global.work_sp[argument0] = global.work_sp[argument0] + (n2 * n5 * n5 * n5);//+250
            //fx
            func_sound_powup();
        }
        break;
    //fish
    case 58:
        if(func_item_use(argument1,n1)){
            instance_create(320,560,effect_player_nrg_drink);
            global.work_hp[argument0] = global.work_hp[argument0] + (n2*n5*n2*n2);//+40
            //fx
            func_sound_powup();
        }
        break;
    //balloon
    case 62: func_worker_balloon(); break;
    //block/object/plant place
    default: func_worker_place(argument0,argument1); break;
}
