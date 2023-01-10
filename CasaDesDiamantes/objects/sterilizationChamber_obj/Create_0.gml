image_speed = 0;
image_index = 0;

sterilization = false;
sterilizationTimer = 600;

sterilizationTimerSave = sterilizationTimer;

smokeEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, smokeEmitter, x - 32, x + 32, y - 48, y + 12, ps_shape_ellipse, ps_distr_gaussian);



