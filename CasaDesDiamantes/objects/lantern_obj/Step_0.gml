/// @description Light

lightSize += choose(0.01, -0.01, 0) * global.dt / 3;
lightSize = clamp(lightSize, lightSizeSave - (lightSizeSave / 1.3), lightSizeSave);

if (broken) {
	if (!playedSound) {
		audio_play_sound_on(emitter, glassBreaking_snd, false, false);
		playedSound = true;
	}
	sprite_index = lanternBroken_spr;
	if (instance_exists(obj_light)) {
		var nearLight = instance_nearest(x, y, obj_light);
		if (distance_to_object(nearLight) < 86) {
			instance_destroy(nearLight);
		}
	}
}