//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (instance_exists(camera_obj)) {
	if (camera_obj.dialogueLine == 140) {
		image_xscale = -1;
	}
}
