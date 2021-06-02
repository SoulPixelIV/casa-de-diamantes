//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!instance_exists(rocket))
{
	instance_destroy();
}
