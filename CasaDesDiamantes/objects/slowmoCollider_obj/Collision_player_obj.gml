slowmo = true;

// Camera Target
if (!slowmoUsed)
{
	camera_obj.cameraTargetMovement = true;
}

if (player_obj.grounded) {
	camera_obj.snapCameraX = false;
	camera_obj.snapCameraY = false;
	camera_obj.follow = player_obj;
	camera_obj.cameraTargetTimer = camera_obj.cameraTargetTimerSave;
	camera_obj.cameraTarget = false;
	camera_obj.cameraTargetMovement = false;
	camera_obj.cameraSpeed = camera_obj.originalCameraSpeed;
	camera_obj.ycameraSpeed = camera_obj.originalyCameraSpeed;
	player_obj.movement = true;
	player_obj.invincible = false;
}