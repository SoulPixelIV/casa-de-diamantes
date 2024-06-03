if (!global.doorDelayStart) {
	if (instance_exists(arrowDown_obj)) {
		global.arrowCindyDone = true;
		save_scr();
	}

	teleporting = true;
	player_obj.movement = false;
}