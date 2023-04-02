/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32 && image_index == 1)
{
	if (player_obj.inputMethod == 0) {
		draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	} else {
		draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
	}
	
	if (keyboard_check_pressed(ord("W"))) {
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
			instance_destroy(player_obj);
			global.level4DoorOpen = true;
			global.spawn = 1;
			room_goto(level4);
		}
	}
}