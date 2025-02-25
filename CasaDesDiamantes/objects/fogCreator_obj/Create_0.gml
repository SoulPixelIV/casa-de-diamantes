fogEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, fogEmitter, x - 180, x + 180, y - 32, y + 86, ps_shape_rectangle, ps_distr_linear);

part_emitter_stream(global.partSystem, fogEmitter, global.fogPart, 5);

goldenEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, goldenEmitter, x - 180, x + 180, y - 32, y + 86, ps_shape_rectangle, ps_distr_linear);

part_emitter_stream(global.partSystem, goldenEmitter, global.goldenPart, -4);


