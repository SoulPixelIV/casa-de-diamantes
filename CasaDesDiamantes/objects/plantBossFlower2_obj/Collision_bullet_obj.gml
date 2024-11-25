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

partEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 32, y + 32, ps_shape_ellipse, ps_distr_invgaussian);

part_emitter_burst(global.partSystem, partEmitter, global.coinRedPart, 40);

part_emitter_destroy(global.partSystem, partEmitter);

audio_play_sound_on(emitter, icecicleShot_snd, false, false);

instance_destroy(other);
instance_destroy();
