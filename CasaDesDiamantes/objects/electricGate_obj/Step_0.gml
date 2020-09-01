/// @description Open Door

if (open)
{
	if (moveDirection == 0)
	{
		if (x > goalX1)
		{
			x -= global.dt / 10;
		}
	}
	if (moveDirection == 1)
	{
		if (x < goalX2)
		{
			x += global.dt / 10;
		}
	}
	if (moveDirection == 2)
	{
		if (y > goalY1)
		{
			y -= global.dt / 10;
		}
	}
	if (moveDirection == 3)
	{
		if (y < goalY2)
		{
			y += global.dt / 10;
		}
	}
}
else
{
	if (x > originX)
	{
		x -= global.dt / 10;
	}
	if (x < originX)
	{
		x += global.dt / 10;
	}
	if (y > originY)
	{
		y -= global.dt / 10;
	}
	if (y < originY)
	{
		y += global.dt / 10;
	}
}
