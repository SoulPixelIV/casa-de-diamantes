if (inMinecart && !global.pause) {
	if (!playedCrashSound) {
		audio_play_sound_on(emitter, minecartHit_snd, false, 1);
		screenshake(60, 24, 0.7, id);
		playedCrashSound = true;
		horspeed = 0;
	}

	inMinecart = false;
	player_obj.grounded = false;
	player_obj.activateTrailEffect = false;
	player_obj.movement = true;
	player_obj.invincible = false;
	player_obj.sittingInMinecart = false;
	player_obj.horspeed += horspeed;
	if (image_xscale == 1) {
		player_obj.x = x - 46;
	} else {
		player_obj.x = x + 46;
	}
	player_obj.y = y - 42;
	jump_scr();
	camera_obj.follow = player_obj;
	camera_obj.minecartCamera = true;
	camera_obj.follow = player_obj;
	camera_obj.cameraSpeed = 0.02;
	camera_obj.ycameraSpeed = 0.02;
	player_obj.colliding = true;
	enterDelay = enterDelaySave;
}
