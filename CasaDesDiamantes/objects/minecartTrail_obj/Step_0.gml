lifetime -= global.dt;

if (lifetime < 0) {
	image_alpha -= global.dt / 30;
}

if (image_alpha < 0.05) {
	instance_destroy();
}
