//Animation
image_speed = 0;
image_index += global.dt / 30;

//Move towards player
if (distance_to_object(player_obj) < 32)
{
	follow = true;
}

if (follow) {
	if (player_obj.x > x)
	{
		horspeed += 0.1 * global.dt;
	}
	else
	{
		horspeed += -0.1 * global.dt;
	}
	
	if (player_obj.y > y)
	{
		verspeed += 0.1 * global.dt;
	}
	else
	{
		verspeed += -0.1 * global.dt;
	}
}

x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;
