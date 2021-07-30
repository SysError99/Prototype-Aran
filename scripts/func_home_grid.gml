///func_home_grid(coor, i);
switch(argument0){
    case 0: switch(argument1){//x
        case 0:
        case 5:
        case 10:
        case 15:
            return 80;
            break;
        case 1:
        case 6:
        case 11:
        case 16:
            return 220;
            break;
        case 2:
        case 7:
        case 12:
        case 17:
            return 360;
            break;
        case 3:
        case 8:
        case 13:
        case 18:
            return 500;
        case 4:
        case 9:
        case 14:
        case 19:
            return 640;
            break;
        default: return 0; break;
    }
    case 1: switch(argument1){//y
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
            return 80;
            break
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
            return 220;
            break;
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
            return 360;
            break;
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
            return 500;
            break;
        default: return 0;
    }
    default: return 0; break;
}
