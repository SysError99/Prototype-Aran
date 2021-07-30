///func_worker_cmd();
//one-click commands
if(mouse_check_button_released(mb_left)){
    //move(reset)
    move_toggle=n0;
    move_xabs=n0;
    move_yabs=n0;
}
//click
if(mouse_check_button_pressed(mb_left)){
    //item use
    if(mouse_x>=480 && mouse_y>=960) {func_sound_click();
        func_worker_item_use(global.current_work,global.current_item);}
    //auto
    else if(point_in_rectangle(mouse_x,mouse_y,0,840,120,960)){func_sound_click();
        //toggle
        if(global.work_at[global.current_work]>n0){
            global.work_at[global.current_work]=n0;
        }else{
            global.work_at[global.current_work]=n1;
        }
    }
    //all_walk
    else if(point_in_rectangle(mouse_x,mouse_y,120,840,240,960)){func_sound_click();
        //toggle
        if(global.all_walk_enabled>n0){
            global.all_walk_enabled=n0;
        }else{
            global.all_walk_enabled=n1;
        }
    }
    //pick
    else if(point_in_rectangle(mouse_x,mouse_y,480,840,600,960)){func_sound_click();
        func_worker_pick(global.current_work);
    }
    else if(hold==0){func_worker_control();}//func_worker_control()
    //move set
    move_toggle=n1;
    move_xorig=mouse_x;
    move_yorig=mouse_y;
}
//hold
if(mouse_check_button(mb_left)){if(mouse_y>=160&&mouse_y<=960){
    var moveDir=point_direction(move_xorig, move_yorig, mouse_x, mouse_y);
    if(point_distance(move_xorig,move_yorig,mouse_x,mouse_y)>80){
        //move
        move_xabs=n0;
        move_yabs=n0;
        if((moveDir > 315 && moveDir < 360) || (moveDir >= 0 && moveDir < 45)) {move_xabs= n1;}//R
        else if(moveDir >  45 && moveDir <= 135) {move_yabs=-n1;}//U
        else if(moveDir > 135 && moveDir <= 225) {move_xabs=-n1;}//L
        else if(moveDir > 225 && moveDir <= 315) {move_yabs= n1;}//D
    }
    if(point_distance(move_xorig,move_yorig,mouse_x,mouse_y)>30){
        //facing
        if((moveDir > 315 && moveDir <= 360) || (moveDir >= 0 && moveDir < 45)) {global.work_a[global.current_work] = 0;}//R
        else if(moveDir >  45 && moveDir <= 135) {global.work_a[global.current_work] = 1;}//U
        else if(moveDir > 135 && moveDir <= 225) {global.work_a[global.current_work] = 2;}//L
        else if(moveDir > 225 && moveDir <= 315) {global.work_a[global.current_work] = 3;}//D
    }
}}
