if (!global.cutsceneLevel2Done) {
	if (!firstBlackscreenUsed) {
		player_obj.inChamber = true;
		player_obj.movement = false;
		firstBlackscreen = true;
		startTimer = true;
	
		firstBlackscreenUsed = true;
	}
}