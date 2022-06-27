//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

lifeTime -= global.dt;

if (lifeTime < 0)
{
	instance_destroy(light);
	instance_destroy();
}