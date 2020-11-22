if (moving)
{
	if (dir == 0)
	{
		y += speedMov * global.dt;
		elevatorTrigger.y += speedMov * global.dt;
		background.y += speedMov * global.dt;
	}
	else
	{
		y -= speedMov * global.dt;
		player_obj.y -= speedMov * global.dt;
		elevatorTrigger.y -= speedMov * global.dt;
		background.y -= speedMov * global.dt;
	}
	for (var i = 0; i < _num; ++i;)
	{
		if (dir == 0)
		{
			_list[| i].y += speedMov * global.dt;
		}
		else
		{
			_list[| i].y -= speedMov * global.dt;
		}
	}
	if (instance_exists(player_obj))
	{
		player_obj.y = y + 48;
		player_obj.movement = false;
		player_obj.gravityOn = false;
		player_obj.horspeed = 0;
		player_obj.verspeed = 0;
		
		camera_obj.follow = goldenElevatorDirtyForeground_obj;
	}
}

if (instance_exists(goal) && moving)
{
	if (y > goal.y && dir == 0)
	{
		moving = false;
		if (instance_exists(player_obj))
		{
			player_obj.movement = true;
			player_obj.gravityOn = true;
			camera_obj.follow = player_obj;
		}
		dir = 1;
	}
	if (y < goal2.y && dir == 1)
	{
		moving = false;
		if (instance_exists(player_obj))
		{
			player_obj.movement = true;
			player_obj.gravityOn = true;
			camera_obj.follow = player_obj;
		}
		dir = 0;
	}
}

