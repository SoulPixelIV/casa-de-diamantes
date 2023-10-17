if (distance_to_object(player_obj) < 42 && place_free(x, y)) {
	falling = true;
}

if (falling) {
	y += global.dt * 1.5;
	image_angle += global.dt / 4;
}

if (!place_free(x, y)) {
	falling = false;
	if (!playedSound) {
		audio_play_sound_on(emitter, metalDrop_snd, false, 1);
		playedSound = true;
	}
}

