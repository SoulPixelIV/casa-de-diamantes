x = camera_obj.x + 400;
y = camera_obj.y;

part_emitter_region(global.partSystem, sparkEmitter, x - 16, x + 16, y - 400, y + 400, ps_shape_ellipse, ps_distr_gaussian);
