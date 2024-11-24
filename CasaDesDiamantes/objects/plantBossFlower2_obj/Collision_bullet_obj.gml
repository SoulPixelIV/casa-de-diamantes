randNum = choose(1,2,3);

if (randNum == 1) {
	instance_create_layer(x, y, "Instances", ammoPackPistolDrop_obj);
}
if (randNum == 2) {
	instance_create_layer(x, y, "Instances", healthpackDrop_obj);
}
if (randNum == 3) {
	instance_create_layer(x, y, "Instances", ammoPackShotgunDrop_obj);
}

audio_play_sound_on(emitter, icecicleShot_snd, false, false);

instance_destroy(other);
instance_destroy();
