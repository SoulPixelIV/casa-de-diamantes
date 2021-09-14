/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) && !used || (place_meeting(x, y, crawler_obj) && instance_nearest(x, y, crawler_obj).usedLever == false && activateByCrawler))
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
		
	image_index = 1;
		
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
				var selfId = id;
				with (instance_nearest(x, y, cameraTarget_obj))
				{
					object = instance_nearest(x, y, selfId.objectAccess);
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
					object[i].open = true;
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
	
	used = true;
}

if (!audio_is_playing(lever_snd))
{
	playedSound = false;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;