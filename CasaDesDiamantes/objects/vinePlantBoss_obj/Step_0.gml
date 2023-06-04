image_xscale += (global.dt / 30) * growSpeed;

despawnTimer -= global.dt;

if (despawnTimer < 0) {
	image_alpha -= global.dt / 70;
}

if (image_alpha < 0.05) {
	instance_destroy();
}




