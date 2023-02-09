x = camera_obj.x;
y = camera_obj.y;

part_emitter_region(global.partSystem, sparkEmitter, x - 260, x + 260, y - 200, y + 200, ps_shape_ellipse, ps_distr_gaussian);
