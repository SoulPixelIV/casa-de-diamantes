if (startTimer) {
	timer -= global.dt;
}

if (firstBlackscreen) {
	camera_obj.blackscreenStrength += global.dt / 10;
	
	if (camera_obj.blackscreenStrength > 1) {
		firstBlackscreen = false;
		spawnEverything = true;
	}
}

if (timer < 0) {
	if (camera_obj.blackscreenStrength > 0.5) {
		camera_obj.blackscreenStrength -= global.dt / 1300;
	}
	startTimer2 = true;
}

if (spawnEverything && !spawnedVines) {
	instance_create_layer(player_obj.x, player_obj.y, "ForegroundObjects", playerVineDeath_obj);
	repeat (14) {
		currVine = instance_create_layer(player_obj.x, player_obj.y, "ForegroundObjects", vine_obj);
		currVine.image_angle = random_range(0, 359);
		currVine.growSpeed = random_range(1, 2.4);
	}
	spawnedVines = true;
}

if (startTimer2) {
	timer2 -= global.dt;
}

if (timer2 < 0) {
	camera_obj.blackscreenStrength += global.dt / 700;
}


