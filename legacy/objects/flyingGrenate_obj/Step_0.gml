x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;
image_angle += global.dt / 2;

if (horspeed > 0)
{
	horspeed -= 0.02 * global.dt / 3;

	if (horspeed < 0.3)
	{
		horspeed = 0;
	}
}
else
{

	horspeed += 0.02 * global.dt / 3;

	if (horspeed > -0.3)
	{
		horspeed = 0;
	}
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

timer -= global.dt;

if (timer < 200)
{
	image_speed = 2;
}
if (timer < 0)
{
	instance_change(explosion_obj, true);
}