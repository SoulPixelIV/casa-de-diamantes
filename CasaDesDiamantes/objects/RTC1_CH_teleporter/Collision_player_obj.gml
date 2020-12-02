if (keyboard_check_pressed(ord("W")))
{
	part_emitter_destroy_all(global.partSystem);
	instance_destroy(player_obj);
	room_goto(level_CasinoHub);
}