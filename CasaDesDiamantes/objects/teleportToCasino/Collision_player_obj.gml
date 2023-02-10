player_obj.movement = false;
blackscreen_scr(0);

delayTimer -= global.dt;

if (delayTimer < 0) {
	part_emitter_destroy_all(global.partSystem);
	instance_destroy(player_obj);
	global.currentWorld = 0;
	room_goto(level_Casino);
}