/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32) {
	if (global.storyAct == 1) {
		if (player_obj.inputMethod == 0) {
			draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
		} else {
			draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
		}
	
		if (keyboard_check_pressed(ord("W")) && !global.doorDelayStart) {
			teleporting = true;
			global.doorDelayStart = true;
			player_obj.movement = false;
		}
	} else {
		camera_obj.drawDiningEntranceText = true;
	}
} else {
	camera_obj.drawDiningEntranceText = false;
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
		if (instance_exists(player_obj)) {
			player_obj.x = Spawn2_obj.x;
			player_obj.y = Spawn2_obj.y;
				
			secondBlackscreenDelay -= global.dt;
			
			if (secondBlackscreenDelay < 0) {
				camera_obj.blackscreenStrength -= (global.dt / 120) * camera_obj.textSpeed;
			} if (camera_obj.blackscreenStrength < 0.05) {
				finishingTeleport = false;
				waitDelay = waitDelaySave;
				secondBlackscreenDelay = secondBlackscreenDelaySave;
				player_obj.movement = true;
			}
			
		}
	}
}