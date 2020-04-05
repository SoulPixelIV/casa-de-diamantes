/// @description Check Player

if (distance_to_object(player_obj) < 32)
{
	if (keyboard_check_pressed(ord("F")))
	{
		image_index = 1;
		used = true;
		
		if (instance_exists(objectAccess))
		{
			var i;
			for (i = 0; i < instance_number(objectAccess); i += 1)
			{
				object[i] = instance_find(objectAccess, i);
				
				if (object[i].open == false)
				{
					object[i].open = true;
					break;
				}
			}
		}
	}
}
