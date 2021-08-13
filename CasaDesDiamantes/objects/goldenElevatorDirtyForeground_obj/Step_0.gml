if (moving)
{
	if (dir == 0)
	{
		y += speedMov * global.dt;
		elevatorTrigger.y += speedMov * global.dt;
		background.y += speedMov * global.dt;
		snapCameraX = false;
		snapCameraY = false;
		screenshake(60, 25, 0.6, id);
	}
	else
	{
		y -= speedMov * global.dt;
		player_obj.y -= speedMov * global.dt;
		elevatorTrigger.y -= speedMov * global.dt;
		background.y -= speedMov * global.dt;
		snapCameraX = false;
		snapCameraY = false;
		screenshake(60, 25, 0.6, id);
	}
	if (instance_exists(player_obj))
	{
		player_obj.y = y - 28;
		player_obj.movement = false;
		player_obj.gravityOn = false;
		player_obj.horspeed = 0;
		player_obj.verspeed = 0;
		camera_obj.follow = goldenElevatorDirtyForeground_obj;
	}
}

if (moving)
{
	if (dir == 0)
	{
		if (y < goal.y + 4 && y > goal.y + 1)
		{
			moving = false;
			if (instance_exists(player_obj))
			{
				player_obj.movement = true;
				player_obj.gravityOn = true;
				camera_obj.follow = player_obj;
				y = goal.y;
			}
			dir = 1;
		}
	}
	else if (dir == 1)
	{
		if (y > goal2.y - 4 && y < goal2.y - 1)
		{
			moving = false;
			if (instance_exists(player_obj))
			{
				player_obj.movement = true;
				player_obj.gravityOn = true;
				camera_obj.follow = player_obj;
				y = goal2.y;
			}
			dir = 0;
		}
	}
}

