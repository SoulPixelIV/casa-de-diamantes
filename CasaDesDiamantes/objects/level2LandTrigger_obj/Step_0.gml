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
	startTimer3 = true;
}

if (startTimer3) {
	timer3 -= global.dt;
}

if (timer3 < 0) {
	camera_obj.blackscreenStrength -= global.dt / 700;
	startTimer4 = true;
}

if (startTimer4) {
	timer4 -= global.dt;
}

if (timer4 < 0 && !spawnedBullet) {
	instance_create_layer(camera_obj.x + global.xScreenSize / 2 + 48, camera_obj.y - global.yScreenSize / 2 - 24, "Instances", bulletLevel2Cutscene_obj);
	spawnedBullet = true;
	startTimer5 = true;
}

if (startTimer5) {
	timer5 -= global.dt;
}

if (timer5 < 0) {
	player_obj.inChamber = false;
	player_obj.movement = true;
	player_obj.inCutscene = false;
	player_obj.shootingAllowed = true;
	camera_obj.cutsceneCamera = false;
	
	musicManager_obj.act1MusicStarted = false;
	
	if (instance_exists(playerVineDeath_obj)) {
		instance_destroy(playerVineDeath_obj);
	}
	if (instance_exists(vine_obj)) {
		instance_destroy(vine_obj);
	}
	
	instance_destroy();
	
	global.cutsceneLevel2Done = true;
}