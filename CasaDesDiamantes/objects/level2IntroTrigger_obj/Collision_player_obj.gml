if (!global.cutsceneLevel2Done) {
	player_obj.inCutscene = true;
	player_obj.shootingAllowed = false;
	camera_obj.cutsceneCamera = true;

	audio_stop_all();
}