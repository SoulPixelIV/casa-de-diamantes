if (distance_to_object(player_obj) < 32)
{
	if (keyboard_check_pressed(ord("F")))
	{
		player_obj.x = doorEnter_obj.x;
		player_obj.y = doorEnter_obj.y;
	}
}
		
