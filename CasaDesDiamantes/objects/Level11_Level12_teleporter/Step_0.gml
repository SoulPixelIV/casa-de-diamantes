if (place_meeting(x, y, player_obj) && !global.doorDelayStart)
{
	teleporting = true;
	player_obj.movement = false;
	global.doorDelayStart = true;
	global.keyRed = false;
	global.keyBlue = false;
	global.keyYellow = false;
}

if (teleporting) {
	blackscreen_scr(0);
	blackscreenDelay -= global.dt;
}

if (blackscreenDelay < 0) {
	finishingTeleport = true;
	blackscreenDelay = blackscreenDelaySave;
	teleporting = false;
}

if (finishingTeleport) {
	waitDelay -= global.dt;
	if (waitDelay < 0) {	
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		room_goto(level12);
	}
}
