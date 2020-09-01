if (open && moveTimer > 0)
{
	if (dir == 0)
	{
		y += global.dt / 10;
		moveTimer -= global.dt;
	}
	if (dir == 1)
	{
		y -= global.dt / 10;
		moveTimer -= global.dt;
	}
	if (dir == 2)
	{
		x += global.dt / 10;
		moveTimer -= global.dt;
	}
	if (dir == 3)
	{
		x -= global.dt / 10;
		moveTimer -= global.dt;
	}
}
