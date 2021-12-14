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
		} else if (teleportpoint == 1) {
			player_obj.x = warpzoneTeleportPoint2_obj.x;
			player_obj.y = warpzoneTeleportPoint2_obj.y;
		//EDEN POWERPLANT WARPZONE LEVEL SWITCH
		} else if (teleportpoint == 2) {
			part_emitter_destroy_all(global.partSystem);
			instance_destroy(player_obj);
			room_goto(warpzone_Powerplant);
		} else if (teleportpoint == 3) {
			part_emitter_destroy_all(global.partSystem);
			instance_destroy(player_obj);
			global.spawn = 2;
			room_goto(level2_Powerplant);
		}
		teleportTimer = teleportTimerSave;
		teleportDelay = teleportDelaySave;
		playerEntered = false;
	}
}
