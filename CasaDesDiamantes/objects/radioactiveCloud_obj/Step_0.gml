lifeTime -= global.dt;

if (lifeTime < 0) {
	part_emitter_destroy(global.partSystem, emitterName);
	instance_destroy();
}
