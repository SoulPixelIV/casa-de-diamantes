//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

despawnTimer -= global.dt;

if (despawnTimer < 0) { 
	instance_destroy();
}
