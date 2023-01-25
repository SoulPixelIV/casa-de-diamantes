x = camera_obj.x + camera_obj.xScreenSize / 2 + 32;
y = camera_obj.y - camera_obj.yScreenSize / 2 - 16;

part_emitter_region(global.partSystem, sparkEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);




