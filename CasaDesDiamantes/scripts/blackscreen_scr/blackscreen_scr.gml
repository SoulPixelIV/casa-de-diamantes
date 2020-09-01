function blackscreen_scr(argument0) {
	if (argument0 == 0)
	{
		if (camera_obj.blackscreenStrength < 1)
		{
			camera_obj.blackscreenStrength += global.dt / 100;
		}
	
		if (camera_obj.blackscreenStrength > 1)
		{
			camera_obj.blackscreenStrength = 1;
		}
	}
	if (argument0 == 1)
	{
		if (camera_obj.blackscreenStrength > 0)
		{
			camera_obj.blackscreenStrength -= global.dt / 100;
		}
	
		if (camera_obj.blackscreenStrength < 0)
		{
			camera_obj.blackscreenStrength = 0;
		}
	}


}
