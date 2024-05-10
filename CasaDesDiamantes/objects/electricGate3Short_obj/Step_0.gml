/// @description Open Door

if (instance_exists(player_obj) && distance_to_object(player_obj) > 32 && place_meeting(x, y, battleArena_obj) || !place_meeting(x, y, battleArena_obj))
{
	if (open)
	{
		if (index == 1) {
			global.level15Shortcut = true;
		}
		
		if (moveDirection == 0)
		{
			if (x > goalX1)
			{
				x -= global.dt / 3;
			}
		}
		if (moveDirection == 1)
		{
			if (x < goalX2)
			{
				x += global.dt / 3;
			}
		}
		if (moveDirection == 2)
		{
			if (y > goalY1)
			{
				y -= global.dt / 3;
			}
		}
		if (moveDirection == 3)
		{
			if (y < goalY2)
			{
				y += global.dt / 3;
			}
		}
	}
	else
	{
		if (x > originX)
		{
			x -= global.dt / 3;
		}
		if (x < originX)
		{
			x += global.dt / 3;
		}
		if (y > originY)
		{
			y -= global.dt / 3;
		}
		if (y < originY)
		{
			y += global.dt / 3;
		}
	}
}

if (index == 1 && global.level15Shortcut) {
	open = true;
}