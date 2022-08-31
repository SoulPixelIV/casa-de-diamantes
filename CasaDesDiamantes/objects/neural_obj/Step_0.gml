//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

lifetime -= global.dt;

if (lifetime < 0)
{
	image_alpha -= global.dt / 100;
}

if (image_alpha < 0.05) {
	instance_destroy();
}
