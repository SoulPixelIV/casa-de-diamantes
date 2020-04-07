//Animation
image_speed = 0;
image_index += global.dt / 15 * animationSpeed;

if (aimDelay > 160)
{
	if (instance_exists(player_obj) && distance_to_object(player_obj) < 256)
	{
	    image_angle = point_direction(x, y, player_obj.x, player_obj.y) + 90;
		if (!audio_is_playing(chaingunLocked_snd))
		{
			audio_play_sound(chaingunLocked_snd, 1, false);
		}
	}
	else
	{
	    image_angle = 90;
	}
}
else
{
	if (!setTarget && player_obj != noone)
	{
		targetX = player_obj.x;
		targetY = player_obj.y;
		setTarget = true;
	}
}

if (instance_exists(player_obj) && distance_to_object(player_obj) < 128)
{
	aimDelay -= global.dt;
}
else
{
    aimDelay = 230;
}

if (aimDelay < 140)
{
	if (animationSpeed < 1)
	{
		animationSpeed += global.dt / 60;
	}
	if (animationSpeed > 1)
	{
		animationSpeed = 1;
	}
}

if (aimDelay < 0)
{
	shootDelay -= global.dt;
}

if (aimDelay < -200)
{
	aimDelay = 230;
	throttle = true;
	setTarget = false;
}

if (throttle)
{  
	if (animationSpeed > 0)
	{
		animationSpeed -= global.dt / 60;
	}
	if (animationSpeed < 0)
	{
		animationSpeed = 0;
		throttle = false;
	}
}

if (shootDelay < 0)
{
	instance_create_layer(random_range(x - 7, x + 8), y, "Instances", bulletChaingun_obj);
	shootDelay = 5;
}