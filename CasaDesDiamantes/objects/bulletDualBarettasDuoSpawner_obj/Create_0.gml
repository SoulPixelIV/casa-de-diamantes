salveDelay = 6;

var dualBarettasShot = audio_play_sound(pistolShot_snd, 1, false);

if (global.pistolAmmo > 3) {
	audio_sound_pitch(dualBarettasShot, random_range(0.9, 1.1));
}
if (global.pistolAmmo == 3) {
	audio_sound_pitch(dualBarettasShot, 1.2);
}
if (global.pistolAmmo == 2) {
	audio_sound_pitch(dualBarettasShot, 1.4);
}
if (global.pistolAmmo <= 1) {
	audio_sound_pitch(dualBarettasShot, 1.6);
}
	
instance_create_layer(x, y, "Instances", pistolBulletCase_obj);
