bloodEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, bloodEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst(global.partSystem, bloodEmitter, global.bloodPart, 25);

part_emitter_destroy(global.partSystem, bloodEmitter);
