image_xscale = 4;
image_yscale = 4;

healDelay = 6;
healDelaySave = healDelay;

lifeTimer = 1800;

smokeWhiteEmitter = part_emitter_create(global.partSystem2);

part_emitter_region(global.partSystem2, smokeWhiteEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst(global.partSystem2, smokeWhiteEmitter, global.smokeWhitePart, 60);
part_emitter_burst(global.partSystem2, smokeWhiteEmitter, global.healthPart, 28);