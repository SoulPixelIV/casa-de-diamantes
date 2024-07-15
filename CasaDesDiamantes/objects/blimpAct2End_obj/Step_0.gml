//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (startAnim) {
	if (!playedSound) {
		audio_play_sound_on(emitter, blimpFlying_snd, false, 1);
		playedSound = true;
	}
	x -= global.dt / 3;
	y += global.dt / 15;
	teleportTimer -= global.dt;
}

if (teleportTimer < 0) {
	blackscreen_scr(0);
	blackscreenTimer -= global.dt;	
}

if (blackscreenTimer < 0) {
	global.moveToWorld = 4;
	room_goto(blimpAnim);
}

//Sound Position
if (audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0);
}