///object_create();
var objectEnabled = n1;
switch(object){
    //item transformation
    case 0:
        //if yes, transform to another object
        var placeMode=-n1;
        var toPlace=-n1;
        switch(item){
            //item-to-block
            case 2: toPlace=n7; placeMode = n0; break;//wooden wall
            case 4: toPlace=n8; placeMode = n0;  break;//wooden floor
            case 5: toPlace=n9; placeMode = n0;  break;//wooden door
            case 10:toPlace=n2*n2*n3; placeMode = n0;  break;//sand
            case 52:toPlace=n9+n9; placeMode = n0;  break;//bed
            case 60:toPlace=n9+n9+n6; placeMode=n0; break;//shelf
            //item-to-object
            case 8: toPlace=n1; placeMode=n1; break;//smelter
            case 53:toPlace=n9+n1; placeMode=n1; break;//table
            case 63:toPlace=n9+n3; placeMode=n1; break; //small table 0
            case 54:toPlace=n9+n2; placeMode=n1; break;//sit place
            case 56:toPlace=n9; placeMode=n1; break;//tnt
            case 61:toPlace=n2; placeMode=n1; break;//lamp
        }
        //place
        if(placeMode==n0){
            func_block_place(toPlace,ox,oy);//block
            //quest
            quest_watcher(ACTION_BLOCK_PLACE,toPlace,global.map_file,-n1);
        }
        else if(placeMode==n1){
            func_object_place(toPlace,ox,oy);//object
            //quest
            quest_watcher(ACTION_OBJ_PLACE,toPlace,global.map_file,-n1);
        }
        else {
            if(func_plant_place(item,ox,oy)>-n1){//plant
                //quest
                quest_watcher(ACTION_PLANT_PLACE,toPlace,global.map_file,-n1);
                placeMode=n2;
            }
        }
        //delete self, if something that is not an item has been placed
        if(placeMode > -n1) {objectEnabled = n0;}
        break;
}
//transform to normal object
if(objectEnabled > n0) {instance_change(obj_task,true);}
else {instance_destroy();}
