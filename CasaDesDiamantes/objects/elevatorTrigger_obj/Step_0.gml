if (place_meeting(x, y, player_obj) && !used)
{
	instance_nearest(x, y, goldenElevatorDirtyForeground_obj).moving = true;
	used = true;
}
