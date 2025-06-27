/// @description Draw Key

if (global.storyAct == 0) {
	if (global.act2Unlocked) {
		if (distance_to_object(player_obj) < 32)
		{
			if (player_obj.inputMethod == 0) {
				draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
			} else {
				draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
			}
	
			if (player_obj.key_up_pressed) {
				if (instance_exists(player_obj)) {
					instance_destroy(player_obj);
				}
				if (instance_exists(cutieplusSteph_obj)) {
					instance_destroy(cutieplusSteph_obj);
				}
				if (instance_exists(blimp_obj)) {
					blimp_obj.open = true;
				}
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
					room_goto(worldmap);
				}
			}
		}
	} else {
		if (distance_to_object(player_obj) < 32) {
			camera_obj.drawDiningEntranceText = true;
		} else {
			camera_obj.drawDiningEntranceText = false;
		}
	}
}

if (global.storyAct == 1) {
	if (global.meeting2Dialogue) {
		if (distance_to_object(player_obj) < 32)
		{
			if (player_obj.inputMethod == 0) {
				draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
			} else {
				draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
			}
	
			if (player_obj.key_up_pressed) {
				if (instance_exists(player_obj)) {
					instance_destroy(player_obj);
				}
				if (instance_exists(cutieplusSteph_obj)) {
					instance_destroy(cutieplusSteph_obj);
				}
				if (instance_exists(blimp_obj)) {
					blimp_obj.open = true;
				}
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
					room_goto(worldmap);
				}
			}
		}
	} else {
		if (distance_to_object(player_obj) < 32) {
			camera_obj.drawDiningEntranceText = true;
		} else {
			camera_obj.drawDiningEntranceText = false;
		}
	}
}

if (global.storyAct == 2) {
	if (global.tristramCindyQuestioningDialogueDone) {
		if (distance_to_object(player_obj) < 32) {
			if (player_obj.inputMethod == 0) {
				draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
			} else {
				draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
			}
	
			if (player_obj.key_up_pressed) {
				if (instance_exists(player_obj)) {
					instance_destroy(player_obj);
				}
				if (instance_exists(cutieplusSteph_obj)) {
					instance_destroy(cutieplusSteph_obj);
				}
				if (instance_exists(blimp_obj)) {
					blimp_obj.open = true;
				}
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
					room_goto(worldmap);
				}
			}
		}
	} else {
		if (distance_to_object(player_obj) < 32) {
			camera_obj.drawDiningEntranceText = true;
		} else {
			camera_obj.drawDiningEntranceText = false;
		}
	}
}