///func_block_update(x,y);
//update the corresponding block
var uM = func_map_read(argument0,argument1);
switch(uM){
    case 13://wet ground
    case 14://dry ground
    case 15://dirt
        var u = 0; 
        var uD = 0;//detects?
        var uT = -1;//change target
        //find water
        while(u<2&&uD==0){
            //choose
            var uC=6; if(u==1){uC=16;}
            //check 4 quads
            var uS = 0; while(uS<4&&uD==0){
                var uX = argument0;
                var uY = argument1;
                switch(uS){
                    case 0: uX--; break;
                    case 1: uY--; break;
                    case 2: uX++; break;
                    case 3: uY++; break;
                }
                if(uX>=0 && uX<192 && uY>=0 && uY<192){
                    if(func_map_read(uX,uY)==uC){uD=1;}
                }
            uS++;}
        u++;}
        //if there is a water around
        if(uD==1){
            //switch
            switch(uM){
                case 14: uT = n9+n4; break;
                case 15: uT = n9+n7; break;
            }
        }
        //if not
        else{
            //switch
            switch(uM){
                case 13: if(global.weather != n1) uT = n9+n5; break;//wet >> dry (if no rain)
                case 14: if(global.weather == n1){uT = n9+n4;} break;//wet ground if rainy
                case 15: if(irandom_range(0,199)==n0) {uT=global.map_default_block;} break; //growing grass / default block
                case 16: uT = n9+n6; break; //water >> dirt
            }
        }
        //change
        if(uT>-1){
            func_map_write(argument0,argument1,uT);
        }
        break;
}
