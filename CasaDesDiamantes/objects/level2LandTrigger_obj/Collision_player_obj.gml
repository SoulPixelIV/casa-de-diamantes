if (!global.cutsceneLevel2Done) {
	if (!firstBlackscreenUsed) {
		player_obj.inChamber = true;
		player_obj.movement = false;
		firstBlackscreen = true;
		startTimer = true;
		audio_play_sound(impactGround_snd, 1, false);
	
		firstBlackscreenUsed = true;
	}
}