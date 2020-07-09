image_angle += global.dt + turnSpeed;

x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

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

//Gravity
if (verspeed < 3)
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

//Death
lifetime -= global.dt;

if (lifetime < 0)
{
	image_alpha -= global.dt / 300;
}
if (image_alpha < 0.03)
{
	instance_destroy();
}
