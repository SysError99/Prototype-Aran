///func_file_str(location);
var _ff = file_text_open_read(argument0);
var _tt = file_text_read_string(_ff);
file_text_close(_ff);
return _tt;
