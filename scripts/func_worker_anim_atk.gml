///func_worker_anim_atk(worknum);
switch(global.work_a[argument0]){
    case 0: case 3://R, D
        switch(global.work_walk_frame [argument0]){
            case 4: global.work_walk_frame [argument0] = n1; break;
            default: global.work_walk_frame [argument0] = n4; break;
        }
        break;
    case 1: case 2://U, L
        switch(global.work_walk_frame [argument0]){
            case 3: global.work_walk_frame [argument0] = n1; break;
            default: global.work_walk_frame [argument0] = n3; break;
        }
        break;
}

