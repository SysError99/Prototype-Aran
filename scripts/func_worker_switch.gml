///func_worker_switch();
var m = global.map_team;
switch(global.current_work){
    case 0:
        if(global.team[#m,n1]>-n1){
            global.current_work=n1;
        }
        else if(global.team[#m,n2]>-n1){
            global.current_work=n2;
        }
        else if(global.team[#m,n3]>-n1){
            global.current_work=n3;
        }
        break;
    case 1:
        if(global.team[#m,n2]>-n1){
            global.current_work=n2;
        }
        else if(global.team[#m,n3]>-n1){
            global.current_work=n3;
        }
        else if(global.team[#m,n0]>-n1){
            global.current_work=n0;
        }
        break;
    case 2:
        if(global.team[#m,n3]>-n1){
            global.current_work=n3;
        }
        else if(global.team[#m,n0]>-n1){
            global.current_work=n0;
        }
        else if(global.team[#m,n1]>-n1){
            global.current_work=n1;
        }
        break;
    case 3:
        if(global.team[#m,n0]>-n1){
            global.current_work=n0;
        }
        else if(global.team[#m,n1]>-n1){
            global.current_work=n1;
        }
        else if(global.team[#m,n2]>-n1){
            global.current_work=n2;
        }
        break;
}
