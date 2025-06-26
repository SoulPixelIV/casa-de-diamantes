//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

teleportTimer -= global.dt;

if (teleportTimer < 0) {
	part_emitter_destroy_all(global.partSystem);
	audio_stop_all();
	global.transitionScreenDest = level20;
	room_goto(transitionScreen);
}