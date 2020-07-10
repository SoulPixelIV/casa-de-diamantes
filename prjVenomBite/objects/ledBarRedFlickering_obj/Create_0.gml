/// @description Variables

lightSize = 2.6;
lightStrength = 0.95;

lightSizeSave = lightSize;

alarm[0] = random_range(1, 50);

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 48, x + 48, y - 48, y + 48, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, sparkEmitter, global.ledRedPart, -50);