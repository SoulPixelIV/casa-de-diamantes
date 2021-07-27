function fullDeath_scr() {
	camera_obj.noZoom = false;
	camera_obj.deathVignette = false;
	camera_obj.noHUD = false;
	camera_obj.drawInfectionText = false;
	player_obj.movement = true;
	player_obj.hp = 100;
	player_obj.maxhp = 100;
	player_obj.deathActivated = false;
	
	//Destroy every Enemy
	instance_activate_object(enemy_obj);
	with (enemy_obj)
	{
		instance_destroy();
	}

	//Reset Enemies
	instance_activate_object(enemyHiddenSpawnpoint_obj);
	with (enemyHiddenSpawnpoint_obj)
	{
		createEnemy = true;
	}

	if (player_obj.lastCheckpoint != noone)
	{
		player_obj.x = player_obj.lastCheckpoint.x;
		player_obj.y = player_obj.lastCheckpoint.y - 64;
		instance_activate_region((player_obj.lastCheckpoint.x - xScreenSize / 2) - 256, (player_obj.lastCheckpoint.y - yScreenSize / 2) - 256, xScreenSize + 512, yScreenSize + 512, true);
	}
	else
	{
		player_obj.x = player_obj.firstPosX;
		player_obj.y = player_obj.firstPosY;
		instance_activate_region((player_obj.firstPosX - xScreenSize / 2) - 256, (player_obj.firstPosY - yScreenSize / 2) - 256, xScreenSize + 512, yScreenSize + 512, true);
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
}
