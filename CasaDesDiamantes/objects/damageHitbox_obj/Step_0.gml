timer -= global.dt;

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

if (!instance_exists(body)) {
	instance_destroy();
}