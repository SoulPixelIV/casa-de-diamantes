image_xscale += (global.dt / 30) * growSpeed;

stopTimer -= global.dt;
despawnTimer -= global.dt;

if (stopTimer < 0 ) {
	growSpeed = 0;
}

if (despawnTimer < 0) {
	image_alpha -= global.dt / 70;
}

if (image_alpha < 0.05) {
	instance_destroy();
}




