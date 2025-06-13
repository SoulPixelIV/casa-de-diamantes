//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (open) {
	sprite_index = cindyConsumed_spr;
	startKomoDelay = true;
	repeat(8) {
		var vine = instance_create_layer(x, y, "BackgroundObjects", vine_obj);
		vine.image_angle = random_range(0, 359);
		vine.growSpeed = random_range(0.8, 1.2);
	}
	open = false;
}

if (startKomoDelay) {
	startKomoDelayTimer -= global.dt;
	if (startKomoDelayTimer < 0) {
		if (instance_exists(cindy8_obj)) {
			komo8_obj.open = true;
			startKomoDelay = false;
		}
	}
}