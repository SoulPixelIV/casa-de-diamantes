if (place_meeting(x, y, player_obj) && !global.doorDelayStart)
{
	teleporting = true;
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
		global.warpzone1Done = true;
		instance_destroy(player_obj);
		global.spawn = 2;
		room_goto(level5A);
	}
}
