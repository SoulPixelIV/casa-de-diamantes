lifeTime -= global.dt;

if (lifeTime < 0) {
	part_emitter_destroy(global.partSystem, toxicEmitter);
	instance_destroy();
}
