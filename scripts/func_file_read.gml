///func_file_read(location);
var _ff = file_text_open_read(argument0);
var _tt = "";
while(!file_text_eof(_ff)){
    _tt = _tt + file_text_read_string(_ff) + file_text_readln(_ff);
}
file_text_close(_ff);
return _tt;
