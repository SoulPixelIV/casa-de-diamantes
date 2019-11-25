dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

x += horspeed * dt;
y += verspeed * dt;

if (horspeed > 0)
{
	horspeed -= 0.002 * dt;

	if (horspeed < 0.3)
	{
		horspeed = 0;
	}
}
else
{

	horspeed += 0.002 * dt;

	if (horspeed > -0.3)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 14)
{
	verspeed -= gravityStrength * dt;
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    while (place_free(x + sign(horspeed), y))
    {
        x += sign(horspeed * dt);
    }
    horspeed = 0;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    while (place_free(x, y + sign(verspeed)))
    {
        y += sign(verspeed * dt);
    }
    verspeed = 0;   
}