x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

if (horspeed > 0)
{
	if (!place_meeting(x, y, booster_obj))
	{
		horspeed -= 0.004 * global.dt / 3;
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
		horspeed += 0.004 * global.dt / 3;
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
    horspeed = 0;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    verspeed = 0;   
}

//Animation
image_speed = 0;
image_index += global.dt / 30;