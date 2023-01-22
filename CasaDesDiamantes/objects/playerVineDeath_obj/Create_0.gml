animationSpeed = 0.5;

//Particles
infectionEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, infectionEmitter, x - 32, x + 32, y - 24, y + 24, ps_shape_ellipse, ps_distr_gaussian);



