///func_dy(currenttime,time);
//give a y position for each time gap
//return 1200*(cos(degtorad(90*(argument0/argument1))));
return lerp(1200, 0, (argument0/argument1)*(argument0/argument1)*(3-2*(argument0/argument1)));
