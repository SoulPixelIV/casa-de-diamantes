if (elevatorNumber != 0) {
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
		if (elevatorNumber == 1) {
			player_obj.x = Spawn3_obj.x;
			player_obj.y = Spawn3_obj.y;
			player_obj.movement = true;
			finishingTeleport = true;
			blackscreenDelay = blackscreenDelaySave;
			teleporting = false;
		}
		
		if (elevatorNumber == 2) {
			part_emitter_destroy_all(global.partSystem);
			instance_destroy(player_obj);
			global.spawn = 0;
			room_goto(level26);
		}
		
		if (elevatorNumber == 3) {
			part_emitter_destroy_all(global.partSystem);
			instance_destroy(player_obj);
			global.spawn = 0;
			room_goto(level27);
		}
		
		if (elevatorNumber == 4) {
			player_obj.x = Spawn2_obj.x;
			player_obj.y = Spawn2_obj.y;
			player_obj.movement = true;
			finishingTeleport = true;
			blackscreenDelay = blackscreenDelaySave;
			teleporting = false;
		}
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
}

