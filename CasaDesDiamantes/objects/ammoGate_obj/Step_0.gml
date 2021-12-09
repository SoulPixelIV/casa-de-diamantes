if (place_meeting(x, y, player_obj)) {
	if (!used) {
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, x - 32, x + 24, y, y + 92, ps_shape_ellipse, ps_distr_invgaussian);

		part_emitter_burst(global.partSystem, partEmitter, global.coinBluePart, 250);

		part_emitter_destroy(global.partSystem, partEmitter);
		
		global.unlockedWeapon[1] = false;
		global.unlockedWeapon[2] = false;
		global.pistolAmmo = 0;
		global.shotgunAmmo = 0;
		
		used = true;
	}
} else {
	used = false;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;