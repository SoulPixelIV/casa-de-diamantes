toxicEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, toxicEmitter, x - 128, x + 128, y - 128, y + 128, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, toxicEmitter, global.toxicPart, -3);


