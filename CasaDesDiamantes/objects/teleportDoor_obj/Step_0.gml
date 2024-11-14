if (distance_to_object(player_obj) < 32 && !global.doorDelayStart)
{
	if (keyboard_check_pressed(ord("W"))) {
		teleporting = true;
		player_obj.movement = false;
		global.doorDelayStart = true;
	}
}

if (teleporting) {
	blackscreen_scr(0);
	blackscreenDelay -= global.dt;
}

if (blackscreenDelay < 0) {
	if (teleportpoint == 1) {
		player_obj.x = Spawn1_obj.x;
		player_obj.y = Spawn1_obj.y;
	}
	if (teleportpoint == 2) {
		player_obj.x = Spawn2_obj.x;
		player_obj.y = Spawn2_obj.y;
	}
	if (teleportpoint == 3) {
		player_obj.x = Spawn3_obj.x;
		player_obj.y = Spawn3_obj.y;
	}
	if (teleportpoint == 4) {
		player_obj.x = Spawn4_obj.x;
		player_obj.y = Spawn4_obj.y;
	}
	if (teleportpoint == 5) {
		player_obj.x = Spawn5_obj.x;
		player_obj.y = Spawn5_obj.y;
	}
	if (teleportpoint == 6) {
		player_obj.x = Spawn6_obj.x;
		player_obj.y = Spawn6_obj.y;
	}
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

