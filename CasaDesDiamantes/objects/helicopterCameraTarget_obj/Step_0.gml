if (!global.helicopterIntro) {
	if (cutsceneTimer > 0) {
		camera_obj.follow = id;
		camera_obj.drawBlackborders = true;
		player_obj.movement = false;
		player_obj.invincible = true;
	}
	
	cutsceneTimer -= global.dt;

	if (cutsceneTimer < 0) {
		player_obj.movement = true;
		player_obj.invincible = false;
		camera_obj.follow = player_obj;
	}

	if (cutsceneTimer < -500) {
		camera_obj.drawBlackborders = false;
		global.helicopterIntro = true;
	}
}
