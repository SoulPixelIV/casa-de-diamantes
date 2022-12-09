liveTimer -= global.dt;

if (liveTimer < 0) {
	instance_destroy();
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!place_meeting(x, y + 16, collider_obj) && !place_meeting(x, y + 16, colliderOneWay_obj)) {
	instance_destroy();
}

if (place_meeting(x + 8 * checkDir, y - 8, collider_obj) || place_meeting(x + 8 * checkDir, y - 8, colliderOneWay_obj)) {
	instance_destroy();
}