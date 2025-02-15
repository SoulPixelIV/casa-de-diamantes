toxicEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, toxicEmitter, x - 180, x + 180, y - 32, y + 48, ps_shape_ellipse, ps_distr_linear);

part_emitter_stream(global.partSystem, toxicEmitter, global.fogPart, 2);


