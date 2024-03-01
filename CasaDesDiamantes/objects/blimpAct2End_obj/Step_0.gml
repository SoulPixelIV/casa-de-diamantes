//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (startAnim) {
	if (!playedSound) {
		audio_play_sound(blimpFlying_snd, 1, false);
		playedSound = true;
	}
	x -= global.dt / 3;
	y += global.dt / 15;
	teleportTimer -= global.dt;
}

if (teleportTimer < 0) {
	global.moveToWorld = 1;
	room_goto(blimpAnim);
}