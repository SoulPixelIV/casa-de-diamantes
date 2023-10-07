x += movspeed * global.dt;

part_emitter_region(global.partSystem, voidEmitter, x - 186, x + 186, y - 186, y + 186, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_region(global.partSystem, eyesEmitter, x - 148, x + 148, y - 148, y + 148, ps_shape_ellipse, ps_distr_gaussian);

screenshake(50, 15, 0.6, id);

if (movspeed > movspeedMax) {
	movspeed -= global.dt / 10;
}
