x = camera_obj.x + global.xScreenSize / 2 + 76;
y = camera_obj.y - global.yScreenSize / 2 - 48;

part_emitter_region(global.partSystem, sparkEmitter, x - 128, x + 128, y, y + 128, ps_shape_ellipse, ps_distr_gaussian);




