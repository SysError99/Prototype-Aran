///func_plant_update();
//update plants (when fall asleep)
if(instance_exists(obj_task)){with(obj_task){if(object==n4){
    var isGood = n1;
    var groundNeeded = -n1
    switch(global.plant_grows[#pid,PLANT_GROUND]){
        case 0: groundNeeded=n0; break;//grassy
        case 1: groundNeeded=n9+n5; break;//dry
        case 2: groundNeeded=n9+n4; break;//wet
        case 3: groundNeeded=n9+n8; break;//fine
    }
    //check ground
    var groundCurrent = func_map_read(ox,oy)
    if(groundCurrent != groundNeeded){ //others
        if(groundNeeded == n9+n4){ //wet == fine
            if(groundCurrent != n9+n8){
                isGood=n0;
            }
        }else if(groundNeeded == n9+n8){ //fine == wet
            if(groundCurrent != n9+n4){
                isGood=n0;
            }
        }else{
            isGood=n0;
        }
    }
    //check weather
    /*else if(global.plant_grows[#pid,PLANT_WEATHER]>-n1){
        if(global.plant_grows[#pid,PLANT_WEATHER]!=abs(global.data[#pid,MONTH])){
            isGood=n0;
        }
    }*/
    //good conditions
    if(isGood==n1){
        if(day<growday-n1) {
            day++; //add one more day
        }
        else{
            if(state<n4){
                state++; //grow up!
            }
            day=n0;
        }
    }
    //not good conditions
    else{
        ohp-=100;
    }
    //suck water (fine ground)
    if(func_map_read(ox,oy)==n9+n8){
        func_map_write(ox,oy,n9+n5);
    }
}}}
