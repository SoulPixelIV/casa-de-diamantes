if (instance_exists(camera_obj)) {
	x = camera_obj.x - global.xScreenSize / 2;
	y = camera_obj.y - global.yScreenSize / 2;
}

if (image_alpha > 0.95) {
	delayBeforeTeleport -= global.dt;
}

if (delayBeforeTeleport < 0) {
	part_emitter_destroy_all(global.partSystem);
	audio_stop_all();
	instance_destroy(player_obj);
	room_goto(transitionScreen2);
}

