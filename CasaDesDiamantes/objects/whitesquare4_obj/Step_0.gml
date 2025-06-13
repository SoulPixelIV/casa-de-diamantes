if (instance_exists(camera_obj)) {
	x = camera_obj.x - global.xScreenSize / 2;
	y = camera_obj.y - global.yScreenSize / 2;
}

if (open) {
	if (image_alpha < 1) {
		image_alpha += global.dt / 30;
	}
	startDelay -= global.dt;
}

if (startDelay < 0) {
	open = false;
	if (image_alpha > 0) {
		image_alpha -= global.dt / 700;
	}
}
