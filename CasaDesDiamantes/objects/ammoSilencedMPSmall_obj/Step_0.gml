x += horspeed * global.dt;
y += verspeed * global.dt;

image_angle += global.dt / 10;

despawnTimer -= global.dt;
if (despawnTimer < 0)
{
	instance_destroy();
}

//Gravity
if (followTimer > 0)
{
	if (verspeed < 2)
	{
		verspeed -= gravityStrength * global.dt / 3;
	}
}

//Move towards player
followTimer -= global.dt;

if (followTimer == 0)
{
	horspeed = 0;
	verspeed = 0;
}
if (followTimer < 0)
{
	if (instance_exists(player_obj))
	{
		move_towards_point(player_obj.x, player_obj.y, global.dt * 2);
	}
}