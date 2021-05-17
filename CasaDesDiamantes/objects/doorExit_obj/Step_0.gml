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
	if (!doorEnter_obj.entered)
	{
		blackscreen_scr(1);
	}
}

if (!doorEnter_obj.entered)
{
	if (camera_obj.blackscreenStrength == 1 && entered)
	{
		snapCameraX = false;
		snapCameraY = false;
		player_obj.x = doorEnter_obj.x;
		player_obj.y = doorEnter_obj.y - 12;
		camera_obj.xTo = doorEnter_obj.x;
		camera_obj.yTo = doorEnter_obj.y - 12;
		player_obj.movement = true;
		entered = false;
	}
}