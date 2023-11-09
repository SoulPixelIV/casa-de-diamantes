liveTimer -= global.dt;

if (liveTimer < 0) {
	instance_destroy();
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!instance_exists(whiteExplosionEffectSmall_obj)) {
	instance_destroy();
}