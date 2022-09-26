x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

invTimer -= global.dt;
despawnTimer -= global.dt;
if (despawnTimer < 0)
{
	instance_destroy();
}

if (horspeed > 0)
{
	if (!place_meeting(x, y, booster_obj))
	{
		horspeed -= 0.006 * global.dt / 3;
	}

	if (horspeed < 0.1)
	{
		horspeed = 0;
	}
}
else
{
	if (!place_meeting(x, y, booster_obj))
	{
		horspeed += 0.006 * global.dt / 3;
	}

	if (horspeed > -0.1)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 14)
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
	if (invTimer < 0) {
		if (distance_to_object(player_obj) < 32)
		{
			move_towards_point(player_obj.x, player_obj.y, global.dt);
		}
		else
		{
			speed = 0;
		}
	}
}
//verspeed
if (!place_free(x, y + verspeed))
{
    verspeed = 0;   
}

//Animation
image_speed = 0;
image_index += global.dt / 30;