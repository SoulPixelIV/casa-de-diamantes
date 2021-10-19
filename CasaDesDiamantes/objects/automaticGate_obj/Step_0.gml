/// @description Open Door
if (instance_exists(player_obj))
{
	if (player_obj.y < y - 32) {
		open = true;
	}
	
	if (open)
	{
		if (moveDirection == 0)
		{
			if (x > goalX1)
			{
				x -= global.dt;
			}
		}
		if (moveDirection == 1)
		{
			if (x < goalX2)
			{
				x += global.dt;
			}
		}
		if (moveDirection == 2)
		{
			if (y > goalY1)
			{
				y -= global.dt;
			}
		}
		if (moveDirection == 3)
		{
			if (y < goalY2)
			{
				y += global.dt;
			}
		}
	}
	else
	{
		if (x > originX)
		{
			x -= global.dt;
		}
		if (x < originX)
		{
			x += global.dt;
		}
		if (y > originY)
		{
			y -= global.dt;
		}
		if (y < originY)
		{
			y += global.dt;
		}
	}
}
