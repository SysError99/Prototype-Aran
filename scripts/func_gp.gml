///func_gp(command, amount, note);
var _gpState = -n1; // -1: failed, -2: insufficient
var _gpData = ds_map_create();
//load
var _gpStr = js_load_data("gpdata");
if(_gpStr!=""){
    ds_map_read(_gpData,base64_decode(func_data(n1,_gpStr)));
} _gpStr = "";//clean
//op
if(argument0==GP_CMD_GET){
    if(ds_map_exists(_gpData,"gpdata")){
        _gpState = _gpData[?"gpdata"]; //show gp
    }
    else{
        _gpState = n0; //no gp
    }
}
else if(argument0==GP_CMD_ADD){
    //change data
    if(ds_map_exists(_gpData,"gpdata")){
        //add
        _gpData[?"gpdata"] = _gpData[?"gpdata"] + argument1;
    }
    else{
        //create
        _gpData[?"gpdata"] = argument1;
    }
    //save transcation
    ds_map_add(_gpData,argument2,argument1);
}
else if(argument0==GP_CMD_SUB){
    //change data
    if(ds_map_exists(_gpData,"gpdata")){
        if(argument1 > _gpData[?"gpdata"]){
            //insufficient
            _gpState=-n2;
        }else{
            //sub
            _gpData[?"gpdata"] = _gpData[?"gpdata"] - argument1;
            //save transcation
            ds_map_add(_gpData, argument2, -argument1);
            //tell state
            _gpState = n0;
        }
    }
    else{
        //no gp
        _gpState=-n2;
    }
}
//save back
js_save_data("gpdata",func_data(n0,base64_encode(ds_map_write(_gpData))))
return _gpState;
