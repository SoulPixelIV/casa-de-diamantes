if (global.hasWarpzoneKey && distance_to_object(player_obj) < 32 && player_obj.key_up) {
	animationSpeed = 1;
	global.hasWarpzoneKey = false;
	used = true;
}

if (image_index > image_number - 1) {
	instance_destroy();
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;