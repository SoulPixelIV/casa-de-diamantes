//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (temporary)
{
	if (instance_nearest(x, y, barrel_obj).hp < 1)
	{
		instance_destroy(light)
		instance_destroy();
	}
}
