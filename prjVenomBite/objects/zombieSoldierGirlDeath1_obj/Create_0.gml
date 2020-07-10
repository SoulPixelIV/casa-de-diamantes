horspeed = 0;
verspeed = 2;
/*
repeat(irandom_range(8, 14))
{
	instance_create_layer(x, y, "GraphicsLayer", fireSpark_obj);
}
*/

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst(global.partSystem, sparkEmitter, global.fireSparkBigPart, 50);

part_emitter_destroy(global.partSystem, sparkEmitter);
