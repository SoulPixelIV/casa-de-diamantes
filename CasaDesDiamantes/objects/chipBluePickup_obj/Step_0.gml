x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

if (horspeed > 0)
{
	if (!place_meeting(x, y, booster_obj))
	{
		horspeed -= 0.002 * global.dt / 3;
	}

	if (horspeed < 0.3)
	{
		horspeed = 0;
	}
}
else
{
	if (!place_meeting(x, y, booster_obj))
	{
		horspeed += 0.002 * global.dt / 3;
	}

	if (horspeed > -0.3)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt / 3;
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
	//Move towards player
	if (distance_to_object(player_obj) < 32)
	{
		if (player_obj.x > x)
		{
			horspeed += 0.1;
		}
		else
		{
			horspeed += -0.1;
		}
	}
	else
	{
		horspeed = 0;
	}
}
else
{
	//Move towards player
	if (distance_to_object(player_obj) < 32)
	{
		if (player_obj.x > x)
		{
			horspeed += 0.1;
		}
		else
		{
			horspeed += -0.1;
		}
	}
}

//verspeed
if (!place_free(x, y + verspeed))
{
    verspeed = 0;   
}

//Move towards player
if (distance_to_object(player_obj) < 32)
{
	if (player_obj.x > x)
	{
		horspeed += 0.1;
	}
	else
	{
		horspeed += -0.1;
	}
}

//Animation
image_speed = 0;
image_index += global.dt / 30;