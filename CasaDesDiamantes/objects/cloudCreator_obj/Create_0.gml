cloudEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, cloudEmitter, x - 180, x + 180, y - 32, y + 86, ps_shape_rectangle, ps_distr_linear);

part_emitter_stream(global.partSystem, cloudEmitter, global.greyCloudPart, 5);


