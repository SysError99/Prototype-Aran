///func_shaft();
///draw_shaft
if(alphaval>359) {alphaval = 0;} else {alphaval+=0.5;}
var a = clamp(abs(cos(degtorad(alphaval))),0.5,1);
draw_set_alpha(a);
draw_sprite(argument0,0,x,y);
draw_set_alpha(1);
