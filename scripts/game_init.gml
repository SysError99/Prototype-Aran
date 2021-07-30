///game_init();
global.debug=n0;//debug mode?
//random generator
randomize();
var _rndKey =  random_get_seed() + current_day+current_month+current_year;
random_set_seed(_rndkey);
func_init();
//initialize core game stuffs
global.file_str = ""; //temp string file for storing some temp files for handling later
global.lang = n0; //language
global.next_room = -n1;
//map
global.map_file="";//map file (for load/save/creation command)
global.map_team=n0; //team that will be used for the mission
global.map=ds_grid_create(192,192);//map_tile_id
global.map_dmg=ds_grid_create(192,192);//map block damage
//results
global.result_message="";
global.result_collected_items=ds_list_create();
///extract database (if there is a code)
GAME_DB_CONSTRUCTOR();
//prepare game database and resources
game_database();
game_resources();
//load save data from app
load_data("gamedata");
game_load_data();
//quest
quest_init();
//debug
GAME_CREATOR_ONLY(3);
