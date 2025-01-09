x = camera_obj.x;
y = camera_obj.y;

part_emitter_region(global.partSystem, sparkEmitter, x - 612, x + 612, y - 400, y + 400, ps_shape_ellipse, ps_distr_gaussian);
