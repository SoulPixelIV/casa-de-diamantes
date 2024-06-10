toxicEmitter = part_emitter_create(global.partSystem);
randNum = floor(random(10000))
emitterName = "toxicEmitter" + string(randNum)

part_emitter_region(global.partSystem, emitterName, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, emitterName, global.toxicPartGreen, -6);

lifeTime = 400;


