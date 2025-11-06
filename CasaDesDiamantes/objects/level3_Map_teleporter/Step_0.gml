if (place_meeting(x, y, player_obj))
{
	teleporting = true;
	player_obj.movement = false;
	
	if (steam_initialised()) {
		if (steam_stats_ready()) {
			if (global.deaths == 0) {
				if (!steam_get_achievement("ACH_NODEATH_WORLD1")) {
					steam_set_achievement("ACH_NODEATH_WORLD1");
					steam_update();
				}
			}
		}
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
		room_goto(stephAnim);
	}
}
