/// @description Variables

lightSize = 3.1;
lightStrength = 0.5;

lightSizeSave = lightSize;

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 48, x + 48, y - 48, y + 48, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, sparkEmitter, global.ledRedPart, -50);