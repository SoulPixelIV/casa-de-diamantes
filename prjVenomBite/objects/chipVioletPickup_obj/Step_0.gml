x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

if (horspeed > 0)
{
	horspeed -= 0.006 * global.dt / 3;

	if (horspeed < 0.1)
	{
		horspeed = 0;
	}
}
else
{

	horspeed += 0.006 * global.dt / 3;

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