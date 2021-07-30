///func_worker_set_pos(worknum,x,y);
var wX = argument1;
var wY = argument2;
switch(argument0){
    case 3: wX += n2; wY += n2; break;
    case 2: wX += n1; wY += n2; break;
    case 1: wX += n2; wY += n1; break;
    case 0: wX += n1; wY += n1; break;
}
//set-pos
global.work_x [argument0] = wX; //x-coor
global.work_y [argument0] = wY; //y-coor
global.work_a [argument0] = n3;//orientation (starts at 0: right: counter-clockwise)
