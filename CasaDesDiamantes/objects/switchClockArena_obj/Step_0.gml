if (!done) {
	if (instance_exists(player_obj)) {
		if (place_meeting(x, y, player_obj)) {
			if (!done) {
				if (instance_exists(lasergate_obj)) {
					lasergate_obj.open = true;
					lifeTimerStart = true;
				}
			
				if (instance_exists(clockTimer_obj)) {
					for (var i = 0; i < instance_number(clockTimer_obj); ++i;) {
					    clock[i] = instance_find(clockTimer_obj, i);
						clock[i].startTimer = true;
					}
				}
			}
			startGame = true;
		}
	}

	if (startGame) {
		initialDelay -= global.dt;
	}

	if (initialDelay < 0) {
		if (!openedBlocks) {
			if (instance_exists(timeblock_obj)) {
				for (var i = 0; i < instance_number(timeblock_obj); ++i;) {
				    block[i] = instance_find(timeblock_obj, i);
					block[i].open = true;
				}
			}
			if (instance_exists(timeblockMoving_obj)) {
				timeblockMoving_obj.open = true;
			}
			openedBlocks = true;
		}
	}

	if (lifeTimerStart) {
		lifeTimer -= global.dt;
	}

	if (lifeTimer < 0) {
		coinSpawnTimer -= global.dt;
		winTimer -= global.dt;
	
		if (!deactivateBlocks) {
			if (instance_exists(timeblock_obj)) {
				for (var i = 0; i < instance_number(timeblock_obj); ++i;) {
					block[i] = instance_find(timeblock_obj, i);
					block[i].open = false;
				}
			}
			timeblockMoving_obj.open = false;
			deactivateBlocks = true;
		}
	
		if (coinSpawnTimer < 0) {
			var randNum = choose(0, 1, 2, 3);
			if (randNum == 0) {
				instance_create_layer(x + random_range(150, -250), y - 48, "Instances", chipBluePickup_obj);
			}
			if (randNum == 1) {
				instance_create_layer(x + random_range(150, -250), y - 48, "Instances", chipRedPickup_obj);
			}
			if (randNum == 2) {
				instance_create_layer(x + random_range(150, -250), y - 48, "Instances", chipVioletPickup_obj);
			}
			if (randNum == 3) {
				instance_create_layer(x + random_range(150, -250), y - 48, "Instances", chipPlatinumPickup_obj);
			}
			coinSpawnTimer = coinSpawnTimerSave;		
		}
	
		if (winTimer < 0) {
			if (instance_exists(lasergate_obj)) {
				lasergate_obj.open = false;
			}
		
			done = true;
			lifeTimerStart = false;
			lifeTimer = lifeTimerSave;
		}
	}
}