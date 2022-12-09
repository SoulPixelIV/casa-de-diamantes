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

if (!place_meeting(x, y, collider_obj) && !place_meeting(x, y, colliderOneWay_obj)) {
	instance_destroy();
}

if (place_meeting(x, y - 32, collider_obj) || place_meeting(x, y - 32, colliderOneWay_obj)) {
	instance_destroy();
}