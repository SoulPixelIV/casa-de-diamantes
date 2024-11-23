//Animation
image_speed = 0;

if (image_index < image_number - 1) {
	image_index += (global.dt / 15) * animationSpeed;
} else {
	if (!spawnedSpike) {
		instance_create_layer(x, y + 10, "BackgroundObjects", plantRootsSpike_obj);
		spawnedSpike = true;
	}
}

lifeTimer -= global.dt;

if (lifeTimer < 0) {
	image_alpha -= global.dt / 50;
}
if (image_alpha < 0.05) {
	instance_destroy();
}
