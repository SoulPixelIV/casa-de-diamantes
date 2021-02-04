//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

lifetime -= global.dt / 4;
if (lifetime < 0)
{
	body.fireballInstance = noone;
	if (instance_exists(light))
	{
		instance_destroy(light);
	}
	instance_destroy();
}

if (instance_exists(light))
{
	with (light)
	{
		light[| eLight.X] = body.x;
		light[| eLight.Y] = body.y;
	}
}