//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

initialDelay -= global.dt;

if (initialDelay < 0) {
	image_alpha -= global.dt / 10;
}

if (image_alpha < 0.05) {
	instance_destroy();
}

x += (global.dt * 1.5) * dir;

if (!place_meeting(x, y + 16, collider_obj) && !place_meeting(x, y + 16, colliderOneWay_obj)) {
	image_alpha -= global.dt / 10;
}

if (place_meeting(x + 8 * checkDir, y - 4, collider_obj) || place_meeting(x + 8 * checkDir, y - 4, colliderOneWay_obj)) {
	instance_destroy();
}



