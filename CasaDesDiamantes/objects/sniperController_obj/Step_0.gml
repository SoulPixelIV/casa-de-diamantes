shootDelay -= global.dt;

if (shootDelay < 0)
{
	var pistolShot = audio_play_sound(pistolShot_snd, 1, false);
	audio_sound_pitch(pistolShot, random_range(0.9, 1.1));
	screenshake(50, 2.5, 0.4, id);
	
	shootDelay = shootDelaySave + random_range(-50, 50);
}