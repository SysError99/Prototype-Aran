////GAME_CREATOR_ONLY(cmdset);
//for debugging or cheating :)
//don't forget to quote it in final release.
var _GCO_CMD = argument0;

//hard backup code
switch(_GCO_CMD){
    //controller.create
    case 2:
        rollback_save = -n1;
        rollback_gp = -n1;
        break;
    //controller.step
    case 0:
        if(mouse_check_button_released(mb_left)){
            if(mouse_x<=40&&mouse_y<=40){
                if(room==room_startup){
                    rollback_save = get_string_async("0",js_load_data("gamedata"));
                }
                else if(room==room_menu){
                //    func_noti_top(global.txt_mission_complete,spr_item,0);
                }
            }
        }
        break;
    //controller.dialog_async
    case 1:
        if(async_load[?"status"]){
            //step0
            if(async_load[?"id"]==rollback_save){
                js_save_data("gamedata",async_load[?"result"]);
                //get gp
                rollback_gp = get_string_async("1",js_load_data("gpdata"));
            }
            //step1
            else if(async_load[?"id"]==rollback_gp){
                js_save_data("gpdata",async_load[?"result"]);
            }
        }
        break;
    //onstart: 
    case 3:
        //reset quest
        //ds_map_destroy(global.quest); ds_map_destroy(global.quest_completed);
        //global.quest = ds_map_create(); global.quest_completed = ds_map_create();
        //game_save_data();
        
        //give building material
        //if(func_item_amount(2)<1000){
        //    func_item_add(2,1000);
        //    func_item_add(4,1000);
        //    func_item_add(5,1000);
        //    func_item_add(52,1000);
        //    func_item_add(53,1000);
        //    func_item_add(54,1000);
        //    func_item_add(60,1000);
        //    func_item_add(61,1000);
        //}
        
        //func_item_add(62,1);
        
        
        //delete homedata_obj
        //save_data("homedata_obj","");
        break;
}
