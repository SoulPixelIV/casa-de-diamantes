/// @description Check for Camera View Objects

with (player_obj)
{
	if (distance_to_object(cameraViewOut_obj) < 256)
	{
		camera_obj.zoomOut = true;
	}
	else
	{
		camera_obj.zoomOut = false;
	}
}
