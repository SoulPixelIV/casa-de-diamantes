if (distance_to_object(player_obj) < 32 && player_obj.key_up_pressed && !used)
{
	if (instance_exists(goldenElevatorDirtyForeground_obj))
	{
		instance_nearest(x, y, goldenElevatorDirtyForeground_obj).moving = true;
	}
	else
	{
		instance_nearest(x, y, goldenElevatorForeground_obj).moving = true;
	}
	used = true;
}

if (!place_meeting(x, y, player_obj) && used)
{
	used = false;
}
