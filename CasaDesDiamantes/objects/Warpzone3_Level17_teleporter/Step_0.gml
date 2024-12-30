if (place_meeting(x, y, player_obj) && !global.doorDelayStart)
{
	teleporting = true;
	global.doorDelayStart = true;
	player_obj.movement = false;
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
		global.warpzone3Done = true;
		global.spawn = 4;
		room_goto(level17);
	}
}
