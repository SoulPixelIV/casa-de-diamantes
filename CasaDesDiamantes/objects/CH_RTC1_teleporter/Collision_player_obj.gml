if (keyboard_check_pressed(ord("W")))
{
	part_emitter_destroy_all(global.partSystem);
	room_goto(level1_RoadToCasino);
	global.spawn = 2;
}