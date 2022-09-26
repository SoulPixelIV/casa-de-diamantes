if (invTimer < 0) {
	global.money += 1;
	camera_obj.scoreSpin = true;
	camera_obj.scoreSpinTimer = camera_obj.scoreSpinTimerSave;
	audio_play_sound(coin1_snd, 1, false);

	partEmitter = part_emitter_create(global.partSystem);
	part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 32, y + 32, ps_shape_ellipse, ps_distr_invgaussian);

	part_emitter_burst(global.partSystem, partEmitter, global.coinBluePart, 15);

	part_emitter_destroy(global.partSystem, partEmitter);
	instance_destroy();
}
