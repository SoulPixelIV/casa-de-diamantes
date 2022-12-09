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



