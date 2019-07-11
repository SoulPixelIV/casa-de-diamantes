/// @description Check for Camera View Objects

with (player_obj)
{
	if (distance_to_object(cameraViewOut_obj) < 200)
	{
		camera_obj.zoomOut = true;
	}
	else if (distance_to_object(cameraViewIn_obj) < 200)
	{
		camera_obj.zoomIn = true;
	}
	else
	{
		camera_obj.zoomOut = false;
	}
}
