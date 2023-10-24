if (keyboard_check_pressed(ord("W")) && place_meeting(x, y, player_obj))
{
	if (instance_exists(arrowDown_obj)) {
		arrow = instance_nearest(x, y, arrowDown_obj);
		instance_destroy(arrow);
	}
	
	teleporting = true;
	player_obj.movement = false;
}

if (teleporting) {
	blackscreen_scr(0);
	blackscreenDelay -= global.dt;
}

if (blackscreenDelay < 0) {
	player_obj.x = Spawn5_obj.x;
	player_obj.y = Spawn5_obj.y;
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
