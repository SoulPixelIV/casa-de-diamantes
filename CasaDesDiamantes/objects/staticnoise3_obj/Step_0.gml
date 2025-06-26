//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

teleportTimer -= global.dt;

if (teleportTimer < 0) {
	audio_stop_all();
	global.transitionScreenDest = level_ConsumedCasino;
	room_goto(transitionScreen);	
}