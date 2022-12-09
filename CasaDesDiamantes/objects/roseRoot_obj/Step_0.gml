liveTimer -= global.dt;

if (liveTimer < 0) {
	instance_destroy();
}

if (image_index > image_number - 1) {
	image_index = image_number -1;
}

if (!place_meeting(x, y + 16, collider_obj) && !place_meeting(x, y + 16, colliderOneWay_obj)) {
	instance_destroy();
}

if (place_meeting(x + 8 * checkDir, y - 8, collider_obj) || place_meeting(x + 8 * checkDir, y - 8, colliderOneWay_obj)) {
	instance_destroy();
}