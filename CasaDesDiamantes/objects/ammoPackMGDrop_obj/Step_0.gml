//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

//Move towards player
if (distance_to_object(player_obj) < 32 && global.silencedMPAmmo != global.silencedMPAmmoMax)
{
	follow = true;
}

if (global.silencedMPAmmo == global.silencedMPAmmoMax) {
	follow = false;
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