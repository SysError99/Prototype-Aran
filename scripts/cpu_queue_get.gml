///cpu_queue_get();
if(global.cpu_queue < global.cpu_queue_max){
    global.cpu_queue++;
}
return global.cpu_queue;
