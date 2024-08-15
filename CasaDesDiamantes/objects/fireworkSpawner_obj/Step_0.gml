burstTimer -= global.dt;

if (burstTimer < 0) {
	part_emitter_burst(global.partSystem, fireworkEmitter, global.fireworkGreenPart, 15);
	burstTimer = random_range(400, 1700);
}