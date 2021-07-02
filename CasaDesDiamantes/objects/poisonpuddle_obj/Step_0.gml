//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

aliveTimer -= global.dt;

if (aliveTimer < 0)
{
	image_alpha -= global.dt / 100;
	if (image_alpha < 0.05)
	{
		if (instance_exists(poisonLight))
		{
			instance_destroy(poisonLight);
		}
		instance_destroy();
	}
}
else
{
	if (image_alpha < 0.95)
	{
		image_alpha += global.dt / 30;
	}
	else
	{
		image_alpha = 1;
	}
}