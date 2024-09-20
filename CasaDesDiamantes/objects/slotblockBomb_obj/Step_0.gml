//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!global.pause) {
	explosionTimer -= global.dt;

	//Play sound
	if (!playedSound)
	{
		var beepShot = audio_play_sound_on(emitter, beep_snd, true, false);
		audio_sound_pitch(beepShot, 0.8);
		playedSound = true;
	}

	if (explosionTimer < 0) {
		audio_stop_sound(beep_snd);
		if (instance_exists(colliderBulletFree_obj)) {
			var col = instance_nearest(x, y, colliderBulletFree_obj);
			if (place_meeting(x, y, col)) {
				instance_destroy(col);
			}
		}
		instance_change(explosion_obj, true);
	}
}