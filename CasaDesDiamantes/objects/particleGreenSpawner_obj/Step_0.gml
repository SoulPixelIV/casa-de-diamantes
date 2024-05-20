x = camera_obj.x;
y = camera_obj.y + camera_obj.yScreenSize / 2 + 32;

part_emitter_region(global.partSystem, sparkEmitter, x - 1612, x + 1612, y - 16, y + 16, ps_shape_ellipse, ps_distr_gaussian);




