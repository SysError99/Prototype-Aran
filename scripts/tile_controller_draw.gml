///tile_controller_draw();
//draw_tile
tile_draw();
//worker selection area
var sX = 400;
var sY = 560;
switch(global.work_a[global.current_work]){
    case 1: sX = 320; sY = 480; break;
    case 2: sX = 240; sY = 560; break;
    case 3: sX = 320; sY = 640; break;
}
draw_background(selection_border,sX,sY);
//weather
switch(global.weather){
    //rainy
    case 1:
        draw_set_colour(c_blue);
        draw_set_alpha(0.1);
        draw_rectangle(0,0,720,1200,false);
        draw_set_colour(c_white);
        draw_set_alpha(1);
        break;
}
//draw_cursor
if(move_toggle>n0){if(move_yorig>=160&&move_yorig<=960){
    draw_sprite(spr_cursor,0,move_xorig,move_yorig);
}}
