///func_map_list_get(coor_x_y);
var _rresult = -n1;
switch(argument0){
    case 0:
        _rresult = (100 * real(string_char_at(global.map_coor_list[|n0],n1))) + (10 * real(string_char_at(global.map_coor_list[|n0],n2))) + real(string_char_at(global.map_coor_list[|n0],n3));
        break;
    case 1:
        _rresult = (100 * real(string_char_at(global.map_coor_list[|n0],n4))) + (10 * real(string_char_at(global.map_coor_list[|n0],n5))) + real(string_char_at(global.map_coor_list[|n0],n6));
        break;
}
return floor(_rresult);
