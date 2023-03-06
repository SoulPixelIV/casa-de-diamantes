/// @description Draw Key
if (distance_to_object(player_obj) < 32)
{
	draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	
	if (keyboard_check_pressed(ord("W"))) {
		global.act2Unlocked = true;
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
			room_goto(worldmap);
		}
	}
}