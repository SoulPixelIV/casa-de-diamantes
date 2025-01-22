/// @description Draw Key
if (distance_to_object(player_obj) < 32)
{
	if (player_obj.inputMethod == 0) {
		draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	} else {
		draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
	}
	
	if (player_obj.key_up_pressed) {
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
			global.moveToWorld = 7;
			room_goto(blimpAnim);
		}
	}
}