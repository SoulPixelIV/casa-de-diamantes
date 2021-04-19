if (y < elevator.y)
{
	y = elevator.y - dist;
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
	animationSpeed = 1;
}
else
{
	animationSpeed = 0;
}
