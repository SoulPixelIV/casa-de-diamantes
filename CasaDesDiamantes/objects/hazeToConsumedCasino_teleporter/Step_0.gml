if (instance_exists(player_obj)) {
	if (place_meeting(x, y, player_obj)) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.transitionScreenDest = level_ConsumedCasino;
		room_goto(transitionScreen);
	}
}
