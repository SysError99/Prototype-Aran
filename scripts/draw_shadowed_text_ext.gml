///draw_shadowed_text_ext(x,y,text,font,halign,valign,color,sep,w,xscale,yscale,angle);
var _a=draw_get_alpha();
draw_set_font(argument3);
draw_set_halign(argument4);
draw_set_valign(argument5);
draw_set_colour(c_black);
draw_set_alpha(_a*0.4);
draw_text_ext_transformed(argument0-1.5,argument1,argument2,argument7,argument8,argument9,argument10,argument11);
draw_text_ext_transformed(argument0+1.5,argument1,argument2,argument7,argument8,argument9,argument10,argument11);
draw_text_ext_transformed(argument0,argument1-1.5,argument2,argument7,argument8,argument9,argument10,argument11);
draw_text_ext_transformed(argument0,argument1+1.5,argument2,argument7,argument8,argument9,argument10,argument11);
draw_set_colour(argument6);
draw_set_alpha(_a);
draw_text_ext_transformed(argument0,argument1,argument2,argument7,argument8,argument9,argument10,argument11);
draw_set_colour(c_white);
