if (distance_to_object(player_obj) < 32)
{
	if (player_obj.key_up_pressed)
	{
		entered = true;
	}
}

if (entered)
{
	blackscreen_scr(0);
	player_obj.movement = false;
}
else
{
	if (!doorExit_obj.entered)
	{
		blackscreen_scr(1);
	}
}

if (!doorExit_obj.entered)
{
	if (camera_obj.blackscreenStrength == 1 && entered)
	{
		snapCameraX = false;
		snapCameraY = false;
		instance_activate_region((doorExit_obj.x - camera_obj.xScreenSize / 2) - 256, (doorExit_obj.y - 12 - camera_obj.yScreenSize / 2) - 256, camera_obj.xScreenSize + 512, camera_obj.yScreenSize + 512, true);
		player_obj.x = doorExit_obj.x;
		player_obj.y = doorExit_obj.y - 12;
		camera_obj.xTo = doorExit_obj.x;
		camera_obj.yTo = doorExit_obj.y - 12;
		player_obj.movement = true;
		entered = false;
	}
}