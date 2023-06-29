x = camera_obj.x + global.xScreenSize / 2 + 32;
y = camera_obj.y - global.yScreenSize / 2 - 16;

part_emitter_region(global.partSystem, sparkEmitter, x - 64, x + 64, y, y + 64, ps_shape_ellipse, ps_distr_gaussian);




