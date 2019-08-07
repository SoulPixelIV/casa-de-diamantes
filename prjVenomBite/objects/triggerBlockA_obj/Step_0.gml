/// @description Trigger

if (distance_to_object(player_obj) < 256)
{
	if (place_meeting(x, y + 128, player_obj))
	{
		instance_destroy();
	}
}
