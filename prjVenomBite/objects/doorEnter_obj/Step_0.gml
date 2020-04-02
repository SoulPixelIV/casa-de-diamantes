if (distance_to_object(player_obj) < 32)
{
	if (keyboard_check_pressed(ord("F")))
	{
		for (i = 0; i < instance_number(doorEnter_obj); i++)
		{
			doors[i] = instance_find(doorEnter_obj, i);
			if (doors[i].id != id)
			{
				teleportDestination = doors[i];
			}
		}
		player_obj.x = teleportDestination.x;
		player_obj.y = teleportDestination.y;
	}
}
		
