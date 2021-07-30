///func_cloud();
//move object like cloud move up down
///draw cloud
if(moment>359){moment=0;}else{moment+=4;}
draw_sprite_ext(argument0,0,x,y+6*sin(degtorad(moment)),1,1,image_angle,c_white,1);
