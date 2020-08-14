/// @description Check Player

if (distance_to_object(player_obj) < 32)
{
	if (keyboard_check_pressed(ord("F")))
	{
		image_index = 1;
		used = true;
		
		if (!playedSound)
		{
			audio_play_sound(lever_snd, 1, false);
			playedSound = true;
		}
		
		if (instance_exists(objectAccess))
		{
			if (objectCount == 1)
			{
				object = instance_nearest(x, y, objectAccess);
				object.open = true;
			}
			else
			{
				var i;
				for (i = 0; i < objectCount; i++)
				{
					object[i] = instance_find(objectAccess, i);
				
					if (object[i] != noone)
					{
						if (object[i].open == false)
						{
							object[i].open = true;
						}
					}
				}
			}
		}
	}
}
