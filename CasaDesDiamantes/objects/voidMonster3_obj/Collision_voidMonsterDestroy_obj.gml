if (!teleporting) {
	audio_stop_sound(jetpack_snd);
	instance_destroy(other);
	instance_destroy();
	part_emitter_destroy(global.partSystem, voidEmitter);
	part_emitter_destroy(global.partSystem, eyesEmitter);
}