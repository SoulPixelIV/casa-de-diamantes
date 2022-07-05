//Animation
image_speed = 0;

if (image_index < image_number - 1) {
	image_index += (global.dt / 15) * animationSpeed;
}

lifeTime -= global.dt;

if (lifeTime < 0)
{
	instance_destroy(light);
	instance_destroy();
}