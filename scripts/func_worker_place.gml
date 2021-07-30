///func_worker_place(worknum, itemid);
var wpx=global.work_x[argument0];
var wpy=global.work_y[argument0];
var wwx=n0;
var wwy=n0;
//get_orientation
switch(global.work_a[argument0]){
    case 0: wwx = n1; break;
    case 1: wwy = -n1; break;
    case 2: wwx = -n1; break;
    case 3: wwy = n1; break;
}
//place
if(func_worker_walk(argument0,wwx,wwy)==n1) {//there is an empty space
    if(func_item_use(argument1,n1)){//try to consume item first
        func_item_place(argument1, wpx,wpy);
    }
}
