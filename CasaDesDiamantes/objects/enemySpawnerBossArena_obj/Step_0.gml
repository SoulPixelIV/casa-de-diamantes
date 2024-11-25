if (open) {
	delay -= global.dt;
	
	if (!createdAnimation) {
		instance_create_layer(x, y, "Instances", stagejumpAnimation_obj);
		createdAnimation = true;
	}
	
	if (delay < 0) {
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 32, y + 32, ps_shape_ellipse, ps_distr_invgaussian);

		part_emitter_burst(global.partSystem, partEmitter, global.coinGreenPart, 40);

		part_emitter_destroy(global.partSystem, partEmitter);

		zombie = instance_create_layer(x, y, "Instances", zombieGirl_obj);
		if (dir == -1) {
			zombie.image_xscale = -1;
			zombie.aggro = true;
		}
		delay = 150;
		open = false;
	}
}
