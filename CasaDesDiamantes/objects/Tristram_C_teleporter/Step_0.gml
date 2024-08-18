if (keyboard_check_pressed(ord("W")) && place_meeting(x, y, player_obj) && !global.doorDelayStart) {
	if (instance_exists(arrowDown_obj)) {
		global.arrowCindyDone = true;
		save_scr();
	}
	teleporting = true;
	player_obj.movement = false;
}

if (teleporting) {
	blackscreen_scr(0);
	blackscreenDelay -= global.dt;
}

if (blackscreenDelay < 0) {
	global.spawn = 8;
	room_goto(level_Casino);
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
