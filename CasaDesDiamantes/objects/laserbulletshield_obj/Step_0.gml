if (!place_meeting(x, y, collider_obj))
{
	y += global.dt;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

aliveTimer -= global.dt;

if (aliveTimer < 0)
{
	image_alpha -= global.dt / 100;
	if (image_alpha < 0.05)
	{
		if (instance_exists(blueLight))
		{
			instance_destroy(blueLight);
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

//Blue Light
with (blueLight)
{
	light[| eLight.X] = body.x;
	light[| eLight.Y] = body.y;
}