/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) || (place_meeting(x, y, crawler_obj) && instance_nearest(x, y, crawler_obj).usedLever == false && activateByCrawler))
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
				if (!used) {
					object.open = true;
				} else {
					object.open = false;
				}
			}
			else
			{
				var selfId = id;
				with (instance_nearest(x, y, cameraTarget_obj))
				{
					object = instance_nearest(x, y, selfId.objectAccess);
					if (!used) {
						object.open = true;
					} else {
						object.open = false;
					}
				}
			}
		}
		else
		{
			for (var i = 1; i < objectCount + 1; i++)
			{
				currObject = instanceNearest(x, y, objectAccess, i);
				if (currObject != noone)
				{
					if (!used) {
						currObject.open = true;
					} else {
						currObject.open = false;
					}
				}
			}
		}
	}
	
	if (instance_exists(objectAccess2))
	{
		if (objectCount2 == 1)
		{
			if (!activateCamera)
			{
				object = instance_nearest(x, y, objectAccess2);
				if (!used) {
					object.open = true;
				} else {
					object.open = false;
				}
			}
			else
			{
				var selfId = id;
				with (instance_nearest(x, y, cameraTarget_obj))
				{
					object = instance_nearest(x, y, selfId.objectAccess2);
					if (!used) {
						object.open = true;
					} else {
						object.open = false;
					}
				}
			}
		}
		else
		{
			for (var i = 1; i < objectCount2 + 1; i++)
			{
				currObject = instanceNearest(x, y, objectAccess2, i);
				if (currObject != noone)
				{
					if (!used) {
						currObject.open = true;
					} else {
						currObject.open = false;
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
	
	used = !used;
	
	//Check synced switches
	if (synced) {
		for (i = 0; i < instance_number(switch_obj); i++) {
			currSwitch = instance_find(switch_obj, i);
			
			if (instance_exists(currSwitch)) {
				if (currSwitch.synced) {
					currSwitch.used = used;
				}
			}
		}
	}
}

if (!audio_is_playing(lever_snd))
{
	playedSound = false;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;