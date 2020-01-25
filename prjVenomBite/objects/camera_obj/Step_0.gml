/// @description Check for Camera View Objects

with (player_obj)
{
	if (distance_to_object(cameraViewOut_obj) < 300)
	{
		camera_obj.zoomOut = true;
	}
	else if (distance_to_object(cameraViewIn_obj) < 300)
	{
		camera_obj.zoomIn = true;
	}
	else
	{
		camera_obj.zoomOut = false;
		camera_obj.zoomIn = false;
	}
}

//VignetteStrength
dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

if (vignetteStrength != 1)
{
	vignetteStrengthTimer -= dt;
}

if (vignetteStrengthTimer < 0)
{
	vignetteStrength = 1;
	vignetteStrengthTimer = vignetteStrengthTimerSave;
}
