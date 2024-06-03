if (invTimer < 0) {
	global.money += 50;
	audio_play_sound(coin3_snd, 1, false);
	camera_obj.scoreSpin = true;
	camera_obj.scoreDif = true;
	camera_obj.scoreSpinTimer = camera_obj.scoreSpinTimerSave;
	camera_obj.scoreDifTimer = camera_obj.scoreDifTimerSave;
	camera_obj.chipDif += 50;

	partEmitter = part_emitter_create(global.partSystem);
	part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 32, y + 32, ps_shape_ellipse, ps_distr_invgaussian);

	part_emitter_burst(global.partSystem, partEmitter, global.coinRedPart, 100);

	part_emitter_destroy(global.partSystem, partEmitter);
	instance_destroy();
}
