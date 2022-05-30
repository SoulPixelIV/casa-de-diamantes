liveTimer -= global.dt;

if (liveTimer < 0) {
	instance_destroy();
}

if (image_index > image_number - 1) {
	image_index = image_number -1;
}