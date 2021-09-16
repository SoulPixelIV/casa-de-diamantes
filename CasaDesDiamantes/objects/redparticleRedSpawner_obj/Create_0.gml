/// @description Variables

lightSize = 3.1;
lightStrength = 0.7;

lightSizeSave = lightSize;

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 86, x + 86, y - 86, y + 86, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, sparkEmitter, global.ledRedPart, -35);
