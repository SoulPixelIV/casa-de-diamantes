/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) || place_meeting(x, y, crawler_obj) && instance_nearest(x, y, crawler_obj).usedLever == false)
{
	if (!playedSound)
	{
		audio_play_sound(lever_snd, 1, false);
		playedSound = true;
	}
	if (instance_exists(crawler_obj))
	{
		instance_nearest(x, y, crawler_obj).usedLever = true;
	}
		
	if (!used)
	{
		image_index = 1;
		used = true;
		
		if (instance_exists(objectAccess))
		{
			if (objectCount == 1)
			{
				if (!activateCamera)
				{
					object = instance_nearest(x, y, objectAccess);
					object.open = true;
				}
				else
				{
					with (instance_nearest(x, y, cameraTarget_obj))
					{
						object = instance_nearest(x, y, instance_nearest(x, y, lever_obj).objectAccess);
						object.open = true;
					}
				}
			}
			else
			{
				var i;
				object[0] = noone;
				for (i = 0; i < objectCount; i++)
				{
					object[i] = noone;
					if (distance_to_object(instance_find(objectAccess, i)) < objectMaxDistance)
					{
						object[i] = instance_find(objectAccess, i);
					}
				
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
	else
	{
		image_index = 0;
		used = false;
		
		if (instance_exists(objectAccess))
		{
			if (objectCount == 1)
			{
				object = instance_nearest(x, y, objectAccess);
				object.open = false;
			}
			else
			{
				var i;
				object[0] = noone;
				for (i = 0; i < objectCount; i++)
				{
					object[i] = noone;
					if (distance_to_object(instance_find(objectAccess, i)) < objectMaxDistance)
					{
						object[i] = instance_find(objectAccess, i);
					}
				
					if (object[i] != noone)
					{
						if (object[i].open == true)
						{
							object[i].open = false;
						}
					}
				}
			}
		}
	}
	// Camera Target
	if (activateCamera && !usedCamera)
	{
		camera_obj.cameraTarget = true;
		usedCamera = true;
	}
}

if (!audio_is_playing(lever_snd))
{
	playedSound = false;
}