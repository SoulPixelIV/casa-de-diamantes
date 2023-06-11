timer -= global.dt;

move_towards_point(goalX, goalY, global.dt * 1.3);

if (distance_to_point(goalX, goalY) < 4) {
	instance_destroy();
}

if (timer < 0)
{
	instance_destroy();
}

if (instance_exists(body))
{
	if (body.hp <= 0)
	{
		instance_destroy();
	}
}

if (follow)
{
	x = followX;
	y = followY;
}