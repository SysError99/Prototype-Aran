///func_tomorrow();
//update date to tomorrow and trigger something
if(global.data[?DAY]<(n3*n2*n5-n1)){
    //count day
    global.data[?DAY]=global.data[?DAY]+n1;
}else{
    global.data[?DAY]=n0;
    //count month
    if(global.data[?MONTH]<n3){
        global.data[?MONTH]=global.data[?MONTH]+n1;
    }else{
        global.data[?MONTH]=n0;
    }
}
//update plants growing
func_plant_update();
//weather
global.weather = choose(n0,n0,n1);
