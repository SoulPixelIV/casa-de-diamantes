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

if (exited)
{
	blackscreen_scr(1);
	player_obj.movement = true;
}

if (camera_obj.blackscreenStrength == 1 && entered)
{
	snapCameraX = false;
	snapCameraY = false;
	doorEnter_obj.exited = true;		
	player_obj.x = doorEnter_obj.x;
	player_obj.y = doorEnter_obj.y - 26;
	camera_obj.x = doorEnter_obj.x;
	camera_obj.y = doorEnter_obj.y - 26;
	entered = false;
}

if (camera_obj.blackscreenStrength == 0 && exited)
{
	exited = false;
}