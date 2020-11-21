if (moving)
{
	if (dir == 0)
	{
		y += global.dt / 3;
		player_obj.y += global.dt / 3;
		background.y += global.dt / 3;
		elevatorTrigger.y += global.dt / 3;
	}
	else
	{
		y -= global.dt / 3;
		player_obj.y -= global.dt / 3;
		background.y -= global.dt / 3;
		elevatorTrigger.y -= global.dt / 3;
	}
	for (var i = 0; i < _num; ++i;)
	{
		if (dir == 0)
		{
			_list[| i].y += global.dt / 3;
		}
		else
		{
			_list[| i].y -= global.dt / 3;
		}
	}
	if (instance_exists(player_obj))
	{
		player_obj.movement = false;
		player_obj.gravityOn = false;
		player_obj.horspeed = 0;
		player_obj.verspeed = 0;
		
		camera_obj.follow = goldenElevatorDirtyForeground_obj;
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
	}
}
