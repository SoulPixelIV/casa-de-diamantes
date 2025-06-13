if (open) {
	if (!playedSound) {
		audio_play_sound(atomicLaser_snd, 1, false);
		playedSound = true;
	}
}

if (playedSound && !screenShakeDone) {
	screenShakeTimer -= global.dt;
	global.chromaticLevel += global.dt / 120;
	magnitudeIncrease += global.dt / 70;
	screenshake(50, 12 + magnitudeIncrease, 0.6, id);
	
	if (screenShakeTimer < 0) {
		screenShakeDone = true;
	}
}

if (global.chromaticLevel > 0 && !chromaticDone && screenShakeTimer < 0) {
	if (instance_exists(whitesquare4_obj)) {
		whitesquare4_obj.open = true;
	}
	if (instance_exists(blacksquare2_obj)) {
		blacksquare2_obj.open = true;
	}
	global.chromaticLevel -= global.dt / 75;
	if (global.chromaticLevel < 0.1) {
		chromaticDone = true;
		global.chromaticLevel = 0;
		image_alpha = 1;
	}
}
