if (initialDelayStart) {
	initialDelay -= global.dt;
}

if (initialDelay < 0 && !playedSound) {
	audio_play_sound(atomicLaserMuffled_snd, 1, false);
	blimpAct2End_obj.startAnim = true;
	playedSound = true;
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
	global.chromaticLevel -= global.dt / 75;
	if (global.chromaticLevel < 0.1) {
		chromaticDone = true;
		global.chromaticLevel = 0;
	}
}

if (startCamera) {
	camera_obj.cameraTarget = true;
	camera_obj.cameraTargetTimer += global.dt;
}