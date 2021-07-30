///func_gameplay_init();
//initialize gameplay data
global.balloon_mode = n0;
global.balloon_x = n0;
global.balloon_y = n0;
//results collector
global.result_created_blocks = n0;
global.result_destroyed_blocks = n0;
global.result_stamina_loss = n0;
global.result_unit_moves = n0;
//results for summary
global.result_old_rank=global.data[?RANK];
func_game_result_clear();
//setup worker
func_worker_setup();
