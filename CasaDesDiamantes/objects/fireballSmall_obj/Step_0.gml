x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

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

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt / 3;
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    instance_destroy();
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    instance_destroy();  
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;