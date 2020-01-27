/// @description Check for Camera View Objects

with (player_obj)
{
	if (distance_to_object(cameraViewOut_obj) < 230)
	{
		currentCameraState = cameraState.zoomOut;
	}
	else if (distance_to_object(cameraViewIn_obj) < 230)
	{
		currentCameraState = cameraState.zoomIn;
	}
	else
	{
		currentCameraState = cameraState.normal;
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
