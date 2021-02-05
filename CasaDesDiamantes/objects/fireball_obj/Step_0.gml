//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (image_alpha < 1)
{
	image_alpha += global.dt / 500;
	image_xscale += global.dt / 500;
	image_yscale += global.dt / 500;
	if (instance_exists(body))
	{
		if (body.hp < 1)
		{
			body.fireballInstance = noone;
			if (firelight != noone)
			{
				instance_destroy(firelight);
			}
			instance_destroy();
		}
	}
}

lifetime -= global.dt / 4;
if (lifetime < 0)
{
	if (instance_exists(body))
	{
		body.fireballInstance = noone;
	}
	if (firelight != noone)
	{
		instance_destroy(firelight);
	}
	instance_destroy();
}

if (image_alpha >= 1)
{
	spawnTime -= global.dt / 4;
}	
	
if (spawnTime < 0)
{
	instance_create_layer(x, y, "Instances", fireballSmall_obj);
	spawnTime = spawnTimeSave + random_range(-10, 10);
}