if (place_meeting(x, y, player_obj))
{
	camera_obj.currentCameraState = cameraState.zoomOut;
	camera_obj.cameraSpeed = cameraSpeed;
}