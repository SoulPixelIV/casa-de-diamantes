if (distance_to_object(player_obj) < 64) {
	if (!global.hasWarpzoneKey) {
		camera_obj.warpzoneMessage = true;
	}
} else {
	camera_obj.warpzoneMessage = false;
}


if (distance_to_object(player_obj) < 32 && global.hasWarpzoneKey && !global.doorDelayStart)
{
	if (keyboard_check_pressed(ord("W"))) {
		teleporting = true;
		player_obj.movement = false;
		global.doorDelayStart = true;
		image_index = 1;
	}
}

if (teleporting) {
	blackscreen_scr(0);
	blackscreenDelay -= global.dt;
}

if (blackscreenDelay < 0) {
	player_obj.x = Spawn4_obj.x;
	player_obj.y = Spawn4_obj.y;
	player_obj.movement = true;
	finishingTeleport = true;
	blackscreenDelay = blackscreenDelaySave;
	teleporting = false;
}

if (finishingTeleport) {
	waitDelay -= global.dt;
	if (waitDelay < 0) {	
		blackscreen_scr(1);
		whitescreenDelay -= global.dt;
	
		if (whitescreenDelay < 0) {	
			whitescreenDelay = whitescreenDelaySave;
			finishingTeleport = false;
			waitDelay = waitDelaySave;
		}
	}
}

