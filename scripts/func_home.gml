///func_home(mode);
//load map from global.file_str
var _mapText = "";
//characters that can't be used in string chains
// "  #  &  '  {  }  \
//map_list
var dataList = ds_list_create();
ds_list_add(dataList,"!");//0
ds_list_add(dataList,"$");//1
ds_list_add(dataList,"%");//2
ds_list_add(dataList,"(");//3
ds_list_add(dataList,")");//4
ds_list_add(dataList,"*");//5
ds_list_add(dataList,"+");//6
ds_list_add(dataList,",");//7
ds_list_add(dataList,"-");//8
ds_list_add(dataList,".");//9
ds_list_add(dataList,"/");//10
ds_list_add(dataList,"0");//11
ds_list_add(dataList,"1");//12
ds_list_add(dataList,"2");//13
ds_list_add(dataList,"3");//14
ds_list_add(dataList,"4");//15
ds_list_add(dataList,"5");//16
ds_list_add(dataList,"6");//17
ds_list_add(dataList,"7");//18
ds_list_add(dataList,"8");//19
ds_list_add(dataList,"9");//20
ds_list_add(dataList,":");//21
ds_list_add(dataList,";");//22
ds_list_add(dataList,"<");//23
ds_list_add(dataList,"=");//24
ds_list_add(dataList,">");//25
ds_list_add(dataList,"?");//26
ds_list_add(dataList,"@");//27
//save mode
if(argument0="save"){
    var _s = "";
    for(my=n0; my<=191; my++){
        for(mx=n0; mx<=191; mx++){
            _s=ds_list_find_value(dataList,func_map_read(mx,my));//fetch
            if(!is_undefined(_s)){_mapText += _s;}else{_mapText+="!"}//add
        }
    }
}
//load mode
else if(argument0="load"){
    var i=n1;
    var mx=n0;
    var my=n0;
    var _s = -n1;
    var len = string_length(global.file_str);
    var _ended = n0;//decline all others
    while(i<=len){
        _s=ds_list_find_index(dataList,string_char_at(global.file_str,i));//fetch
        //add
        if(_ended==0){func_block_place(_s,mx,my);}
        //shift
        mx++;
        if(mx>191){//new y segment
            mx=n0;
            my++;
        }
        if(my>191){
            my=n0;
            _ended=n1;
        }
    i++;}
    global.file_str="";//delete
}
ds_list_destroy(dataList);
return _mapText;
