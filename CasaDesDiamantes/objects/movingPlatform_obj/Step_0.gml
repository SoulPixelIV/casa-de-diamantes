if (place_meeting(x, y, battleArena_obj))
{
	if (instance_place(x, y, battleArena_obj).done)
	{
		moving = true;
	}
}

if (moving && instance_exists(movingPlatformCheckpoint_obj))
{
	y -= global.dt / 3;
	goal = instance_nearest(x, y, movingPlatformCheckpoint_obj);
	if (instance_exists(player_obj))
	{
		player_obj.movement = false;
		player_obj.gravityOn = false;
		player_obj.horspeed = 0;
		player_obj.verspeed = 0;
		player_obj.y = movingPlatform_obj.y - 48;
		
		camera_obj.follow = movingPlatform_obj;
	}
}

if (instance_exists(goal) && moving)
{
	if (y < goal.y)
	{
		moving = false;
		if (instance_exists(player_obj))
		{
			player_obj.movement = true;
			player_obj.gravityOn = true;
			camera_obj.follow = player_obj;
		}
		instance_destroy(goal);
	}
}