part_emitter_burst(global.partSystem, glasShardEmitter, global.glasShardsPart, 25);

part_emitter_destroy(global.partSystem, glasShardEmitter);

if (instance_exists(col)) {
	instance_destroy(col);
}
instance_destroy();


