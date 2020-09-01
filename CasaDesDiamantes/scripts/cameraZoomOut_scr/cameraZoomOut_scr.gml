function cameraZoomOut_scr(argument0, argument1, argument2) {
	if (camera_obj.viewX < argument0 || camera_obj.viewY < argument1)
	{
		camera_obj.viewX += (16 / 12) * argument2;
		camera_obj.viewY += (9 / 12) * argument2;
	}


}
