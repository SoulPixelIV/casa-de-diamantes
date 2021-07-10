spawnedLight = false;
spawnedPart = true;
createdHitbox = false;

collider = noone;

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 4, x + 4, y + 80, y + 78, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, sparkEmitter, global.lasergatePart, -5);