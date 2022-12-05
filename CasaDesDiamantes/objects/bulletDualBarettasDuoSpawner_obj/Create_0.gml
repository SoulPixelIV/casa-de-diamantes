salveDelay = 6;

var dualBarettasShot = audio_play_sound(pistolShot_snd, 1, false);
audio_sound_pitch(dualBarettasShot, random_range(0.9, 1.1));
	
instance_create_layer(x, y, "Instances", pistolBulletCase_obj);
