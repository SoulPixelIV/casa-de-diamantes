if (!playedSound) {
	audio_play_sound(atomicLaserMuffled_snd, 1, false);
	playedSound = true;
	if (instance_exists(powerplantBackground_obj)) {
		powerplantBackground_obj.laserOn = true;
	}
	if (instance_exists(laserWhitescreen_obj)) {
		laserWhitescreen_obj.laserOn = true;
	}
}
