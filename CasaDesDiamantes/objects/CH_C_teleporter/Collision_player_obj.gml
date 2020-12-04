if (keyboard_check_pressed(ord("W")))
{
	part_emitter_destroy_all(global.partSystem);
	global.spawn = 0;
	instance_destroy(player_obj);
	room_goto(level_Casino);
}