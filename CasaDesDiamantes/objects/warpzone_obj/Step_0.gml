//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (teleportTimer < 0) {
	blackscreen_scr(0);
	teleportDelay -= global.dt;
	if (teleportDelay < 0) {
		if (teleportpoint == 0) {
			player_obj.x = warpzoneTeleportPoint1_obj.x;
			player_obj.y = warpzoneTeleportPoint1_obj.y;
		} else {
			player_obj.x = warpzoneTeleportPoint2_obj.x;
			player_obj.y = warpzoneTeleportPoint2_obj.y;
		}
		teleportTimer = teleportTimerSave;
		teleportDelay = teleportDelaySave;
		playerEntered = false;
	}
}
