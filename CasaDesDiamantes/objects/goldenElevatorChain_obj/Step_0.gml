if (elevator.moving)
{
	if (elevator.dir == 0)
	{
		y -= speedMov * global.dt;
	}
	else
	{
		y += speedMov * global.dt;
	}
}

if (elevator.dir == 0)
{
	if (y < elevator.y - 492)
	{
		y = elevator.y;
	}
}
else
{
	if (y > elevator.y)
	{
		y = elevator.y - 492;
	}
}
