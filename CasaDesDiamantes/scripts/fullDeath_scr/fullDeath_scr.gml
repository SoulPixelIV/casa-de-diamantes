function fullDeath_scr() {
	camera_obj.noZoom = false;
	camera_obj.deathVignette = false;
	camera_obj.noHUD = false;
	camera_obj.drawInfectionText = false;
	
	/*
	player_obj.movement = true;
	player_obj.hp = 100;
	player_obj.maxhp = 100;
	player_obj.deathActivated = false;
	player_obj.radiation = 0;
	
	player_obj.grounded = false;
	player_obj.activateTrailEffect = false;
	player_obj.invincible = false;
	player_obj.colliding = true;
	
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
	//Destroy every Minecart
	if (instance_exists(minecartAll_obj)) {
		with (minecartAll_obj) {
			instance_destroy();
		}
	}
	
	instance_activate_object(zombieGirlWounded_obj);
	with (zombieGirlWounded_obj) {
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
	
	//Reset Minecarts
	with (minecartHiddenSpawnpoint_obj) {
		createMinecart = true;
	}
	
	//Reset Pickups
	instance_activate_object(pickupHiddenSpawnpoint_obj);
	with (pickups_obj)
	{
		instance_destroy();
	}
	
	//Reset toxic water and effects
	camera_obj.visualalarmlight = false;
	if (instance_exists(toxicWater_obj)) {
		with (toxicWater_obj) {
			open = false;
			x = startX;
			y = startY;
		}
	}
	if (instance_exists(alarmLamp_obj)) {
		with (alarmLamp_obj) {
			open = false;
		}
	}
	if (instance_exists(automaticGate_obj)) {
		open = false;
	}
	
	//Reset some gates
	instance_activate_object(gates_obj);
	with (gates_obj)
	{
		if (variable_instance_exists(id, "resetAfterDeath")) {
			if (resetAfterDeath) {
				open = false;
			}
		}
	}
	
	//Reset levers
	if (instance_exists(lever_obj)) {
		with (lever_obj) {
			used = false;
		}
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
		setArenaMessage = false;
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
	with (chipBluePickup_obj && chipRedPickup_obj && chipVioletPickup_obj)
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
	
	*/

	//if (global.lastCheckpoint != noone)
	//{
		//instance_activate_region((global.lastCheckpoint.x - camera_obj.xScreenSize / 2) - 256, (global.lastCheckpoint.y - 64 - camera_obj.yScreenSize / 2) - 256, camera_obj.xScreenSize + 512, camera_obj.yScreenSize + 512, true);
		
		//player_obj.x = global.l
		
		//x = 2;
		//y = 2;
		//Check if spawn is not solid
		/*
		var i = 0;
		for (i = 0; i < 76; i++) {
			with (player_obj) {
				if (place_free(global.lastCheckpoint.x, (global.lastCheckpoint.y - 64) - i)) {
					x = global.lastCheckpoint.x;
					y = global.lastCheckpoint.y - 64;
					break;
				}
			
				if (i == 75) {
					x = global.lastCheckpoint.x;
					y = (global.lastCheckpoint.y - 64) - i;
					break;
				}
			}
		}
		*/
	//}
	/*
	else
	{
		instance_activate_region((player_obj.firstPosX - camera_obj.xScreenSize / 2) - 256, (player_obj.firstPosY - camera_obj.yScreenSize / 2) - 256, camera_obj.xScreenSize + 512, camera_obj.yScreenSize + 512, true);
		
		//Check if spawn is not solid
		var i = 0;
		for (i = 0; i < 76; i++) {
			with (player_obj) {
				if (place_free(Spawn1_obj.x, (Spawn1_obj.y - 64) - i)) {
					x = Spawn1_obj.x;
					y = Spawn1_obj.y - 64;
					break;
				}
			
				if (i == 75) {
					x = Spawn1_obj.x;
					y = (Spawn1_obj.y - 64) - i;
					break;
				}
			}
		}
	}
	
	player_obj.plagueTransformation = false;
	player_obj.infection = 0;
	camera_obj.zombiespikeEffectBorder = camera_obj.zombiespikeEffectBorderSave;
	camera_obj.zombiespikeBorderTransparent = camera_obj.zombiespikeBorderTransparentSave;
	camera_obj.showedInf = false;
	camera_obj.showInfOverlay = false;
	camera_obj.InfOverlayTimer = camera_obj.InfOverlayTimerSave;
	camera_obj.infOverlayX = global.xScreenSize;
	camera_obj.infOverlayY = 0;
	camera_obj.infOverlayLocked = false;
	camera_obj.deathInProg = false;
	*/
}
