function fullDeath_scr() {
	camera_obj.noZoom = false;
	camera_obj.deathVignette = false;
	camera_obj.noHUD = false;
	camera_obj.drawInfectionText = false;
	player_obj.movement = true;
	player_obj.hp = 100;
	player_obj.maxhp = 100;
	player_obj.deathActivated = false;
	player_obj.radiation = 0;
	
	//Destroy every Enemy
	instance_activate_object(enemy_obj);
	with (enemy_obj)
	{
		if (variable_instance_exists(id, "dontRespawn")) {
			if (!dontRespawn) {
				instance_destroy();
			}
		}
		else {
			instance_destroy();
		}
	}

	//Reset Enemies
	instance_activate_object(enemyHiddenSpawnpoint_obj);
	with (enemyHiddenSpawnpoint_obj)
	{
		createEnemy = true;
	}
	
	//Reset Pickups
	instance_activate_object(pickupHiddenSpawnpoint_obj);
	with (pickups_obj)
	{
		instance_destroy();
	}
	
	with (pickupHiddenSpawnpoint_obj)
	{
		createPickup = true;
	}
	
	//Reset Arenas
	with (battleArena_obj)
	{
		wave = 0;
		highestWave = 0;
		done = false;
		setWave = false;
		sectionCleared = false;
		enemyCount = 0;
		checkSpawners = false;
		woundedSpawntimer = 2600;
		checkEnemycountTimer = 100;
	}
	with (battleArenaSpawn_obj)
	{
		spawnedEnemy = false;
	}
	
	//Remove chips
	with (chips_obj)
	{
		instance_destroy();
	}
	
	//Reset moving platforms
	with (movingPlatform_obj)
	{
		moving = false;
		goal = noone;
		x = startX;
		y = startY;
	}
	with (movingPlatformCheckpoint_obj)
	{
		used = false;
	}

	if (player_obj.lastCheckpoint != noone)
	{
		instance_activate_region((player_obj.lastCheckpoint.x - camera_obj.xScreenSize / 2) - 256, (player_obj.lastCheckpoint.y - 64 - camera_obj.yScreenSize / 2) - 256, camera_obj.xScreenSize + 512, camera_obj.yScreenSize + 512, true);
		player_obj.x = player_obj.lastCheckpoint.x;
		player_obj.y = player_obj.lastCheckpoint.y - 64;
	}
	else
	{
		instance_activate_region((player_obj.firstPosX - camera_obj.xScreenSize / 2) - 256, (player_obj.firstPosY - camera_obj.yScreenSize / 2) - 256, camera_obj.xScreenSize + 512, camera_obj.yScreenSize + 512, true);
		player_obj.x = player_obj.firstPosX;
		player_obj.y = player_obj.firstPosY;
	}
	
	player_obj.plagueTransformation = false;
	player_obj.infection = 0;
	camera_obj.zombiespikeEffectBorder = camera_obj.zombiespikeEffectBorderSave;
	camera_obj.zombiespikeBorderTransparent = camera_obj.zombiespikeBorderTransparentSave;
	camera_obj.showedInf = false;
	camera_obj.showInfOverlay = false;
	camera_obj.InfOverlayTimer = camera_obj.InfOverlayTimerSave;
	camera_obj.infOverlayX = camera_obj.xScreenSize;
	camera_obj.infOverlayY = 0;
	camera_obj.infOverlayLocked = false;
	camera_obj.deathInProg = false;
}
