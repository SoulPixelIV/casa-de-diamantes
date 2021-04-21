if (y < elevator.y)
{
	y = elevator.y - dist * 2;
}
else
{
	y = elevator.y + dist;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (elevator.moving)
{
	if (elevator.dir == 0)
	{
		animationSpeed = 1;
	}
	else
	{
		animationSpeed = -1;
	}
}
else
{
	animationSpeed = 0;
}
