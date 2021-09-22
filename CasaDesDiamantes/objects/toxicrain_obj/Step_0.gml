//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

lifetime -= global.dt;

if (lifetime < 0) {
	instance_destroy();
}
