//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (instance_exists(light)) {
	with (light) {
		light[| eLight.X] = body.x;
		light[| eLight.Y] = body.y + 128;
	}
}

if (instance_exists(laserDestroyArea_obj)) {
	if (place_meeting(x, y, laserDestroyArea_obj)) {
		instance_destroy(light);
		instance_destroy();
	}
}

if (movement == 1) {
	x -= global.dt;
}
if (movement == 2) {
	x += global.dt;
}