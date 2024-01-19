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

if (followTimer < 0)
{
	if (instance_exists(player_obj))
	{
		if (distance_to_object(player_obj) < 42) {
			move_towards_point(player_obj.x, player_obj.y, global.dt * 2);
		} else {
			horspeed = 0;
			verspeed = 0;
		}
	}
}

//Animation
image_speed = 0;
image_index += global.dt / 30;