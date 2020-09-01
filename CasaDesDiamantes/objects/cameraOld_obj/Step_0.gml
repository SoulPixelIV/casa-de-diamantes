/// @description Check for Camera View Objects

with (player_obj)
{
	if (camera_obj.zoomAFK)
	{
		camera_obj.currentCameraState = cameraState.zoomAFK;
	}
	else if (distance_to_object(cameraViewOut_obj) < 230)
	{
		camera_obj.currentCameraState = cameraState.zoomOut;
	}
	else if (distance_to_object(cameraViewIn_obj) < 230)
	{
		camera_obj.currentCameraState = cameraState.zoomIn;
	}
	else
	{
		camera_obj.currentCameraState = cameraState.normal;
	}
}

//VignetteStrength

if (vignetteStrength != 1)
{
	vignetteStrengthTimer -= global.dt;
}

if (vignetteStrengthTimer < 0)
{
	vignetteStrength = 1;
	vignetteStrengthTimer = vignetteStrengthTimerSave;
}
