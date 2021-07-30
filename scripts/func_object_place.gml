///func_object_place(id,x,y);
//object,ox,oy
var objTask=-n1;
if(argument0>-n1){
    objTask=instance_create(0,0,obj_new);
    objTask.object=argument0;
    objTask.ox=argument1;
    objTask.oy=argument2;
    global.map_obj [argument1,argument2] = objTask;
    var objHP=n1; var objCol=n0; var objSpr = argument0; var objFrame = n0; switch(argument0){
        case 0://item
            objCol = n1;
            objHP = n9*n9;
            break;
        //smelter
        case 1: objHP=n3*n2*n2*n5*n5;//300
                objCol=n1;
                objTask.inside=-n1;//smelting object
                objTask.time=n0;//timecount
                objTask.coals = n0; //coal amount
                break;
        //lamp
        case 2:
            objCol = n1;
            objSpr = spr_tile_lamp;
            objHp = n9*n9;
            break;
        //plant
        case 4:
            objHP = n3*n2*n5*n5*n2;//300
            objCol= n1;
            break;
        //monsters
        case 5:
        case 6:
        case 7:
            objCol= n1;
            objTask.dir = irandom_range(n0,n3); //directiom to go
            objTask.cd = irandom_range(n0,n4); //cooldown for next processing
            objTask.targeted = n0;
            objTask.tx = n0; //target
            objTask.ty = n0;
            objTask.sx = n1; //mirror sprite
            objTask.sy = n1;
            objTask.rt = n0;
            switch(argument0){
                case 5: //0: ladybug
                    objHP = n2*n5*n5; //50
                    objSpr = spr_tile_monster_0;
                    break;
                case 6: //1: spider
                    objHP = n2*n5*n5*n2; //100
                    objSpr = spr_tile_monster_1;
                    break;
                case 7: //2: grasshopper
                    objHP = n3*n5*n5; //75
                    objSpr = spr_tile_monster_2;
                    break;
            }
            break;
        //tnt
        case 9:
            objSpr = spr_tile_tnt;
            objTask.time = n5*n3*n2;//30
            break;
        //table 
        case 10:
            objSpr = spr_tile_table;
            objCol = n1;
            break;
        //sit place
        case 11:
            objSpr = spr_tile_sit_place;
            break;
        //small table 0
        case 12:
            objSpr = spr_tile_small_table_0;
            objCol = n1;
            break;
    }
    objTask.ohp=objHP;
    objTask.omhp=objHP;
    objTask.col=objCol;
    objTask.atkb="";//being attacked by
    //temp vars
    objTask.consume=n0;//for being comsumed state, like being smelted in smelter
    //draw_vars
    objTask.spr=objSpr;
    objTask.frame=objFrame;
    objTask.px=n0;
    objTask.py=n0;
}
return objTask;
