if (place_meeting(x, y, player_obj))
{
	camera_obj.currentCameraState = cameraState.zoomIn;
	camera_obj.cameraSpeed = cameraSpeed;
}