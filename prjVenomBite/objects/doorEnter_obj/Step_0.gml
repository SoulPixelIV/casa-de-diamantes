if (distance_to_object(player_obj) < 32)
{
	if (keyboard_check_pressed(ord("F")))
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
	doorExit_obj.exited = true;		
	player_obj.x = doorExit_obj.x;
	player_obj.y = doorExit_obj.y - 28;
	camera_obj.x = doorExit_obj.x;
	camera_obj.y = doorExit_obj.y - 28;
	entered = false;
}

if (camera_obj.blackscreenStrength == 0 && exited)
{
	exited = false;
}