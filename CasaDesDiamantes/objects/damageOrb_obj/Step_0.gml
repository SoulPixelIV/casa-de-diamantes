timer -= global.dt;
image_angle += global.dt / 4;

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

x += speedX * global.dt;
y += speedY * global.dt;