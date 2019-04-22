/// @description Enemy AI

x += (hspeed / 10000) * (dt - delta_time);
y += (vspeed / 10000) * (dt - delta_time);

if (distance_to_object(player_obj) < 128 && distance_to_object(player_obj) > 16)
{
	if (player_obj.x > x)
	{
		hspeed = movSpeed;
	}
	else
	{
		hspeed = -movSpeed;
	}
	if (dirLookat > 90 && dirLookat < 270)
	{
		image_xscale = -1;
	}
	else
	{
		image_xscale = 1;
	}
}
else
{
	hspeed = 0;
}

dirLookat = point_direction(x, y, player_obj.x, player_obj.y);

