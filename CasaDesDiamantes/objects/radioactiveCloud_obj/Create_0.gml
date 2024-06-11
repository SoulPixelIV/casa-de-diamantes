toxicEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, toxicEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst(global.partSystem, toxicEmitter, global.toxicPartGreen, 50);

lifeTime = 400;


