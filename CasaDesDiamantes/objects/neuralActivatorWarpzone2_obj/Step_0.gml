if (!global.warpzone2Done) {
	if (distance_to_object(player_obj) < 32 && global.hasWarpzoneKey && !global.doorDelayStart)
	{
		if (keyboard_check_pressed(ord("W"))) {
			teleporting = true;
			player_obj.movement = false;
			image_index = 1;
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
			global.transitionScreenDest = warpzone2;
			part_emitter_destroy_all(global.partSystem);
			instance_destroy(player_obj);
			room_goto(transitionScreen);
		}
	}
}

