///func_home_grid(coor, i);
switch(argument0){
    case 0: switch(argument1){//x
        case 0:
        case 3:
        case 6:
            return 160;
            break;
        case 1:
        case 4:
        case 7:
            return 360;
            break;
        case 2:
        case 5:
        case 8:
            return 560;
            break;
        default: return 0; break;
    }
    case 1: switch(argument1){//y
        case 0:
        case 1:
        case 2:
            return 160;
            break
        case 3:
        case 4:
        case 5:
            return 360;
            break;
        case 6:
        case 7:
        case 8:
            return 560;
            break;
        default: return 0;
    }
    default: return 0; break;
}
