invTimer -= global.dt;
despawnTimer -= global.dt;
if (despawnTimer < 0 || distance_to_object(player_obj) > 500)
{
	instance_destroy();
}

//Move towards player
if (distance_to_object(player_obj) < 32)
{
	follow = true;
}

if (follow) {
	if (player_obj.x > x)
	{
		horspeed += 0.1;
	}
	else
	{
		horspeed += -0.1;
	}
	
	if (player_obj.y > y)
	{
		verspeed += 0.1;
	}
	else
	{
		verspeed += -0.1;
	}
} else {
	if (horspeed > 0)
	{
		horspeed -= 0.002 * global.dt / 3;

		if (horspeed < 0.3)
		{
			horspeed = 0;
		}
	}
	else
	{

		horspeed += 0.002 * global.dt / 3;

		if (horspeed > -0.3)
		{
			horspeed = 0;
		}
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
    horspeed = 0;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    verspeed = 0;   
}