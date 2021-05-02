function fullDeath_scr() {
	camera_obj.noZoom = false;
	camera_obj.deathVignette = false;
	camera_obj.noHUD = false;
	camera_obj.drawInfectionText = false;
	player_obj.movement = true;
	player_obj.hp = 100;
	player_obj.maxhp = 100;
	player_obj.deathActivated = false;
	reload_scr();

	if (player_obj.lastCheckpoint != noone)
	{
		player_obj.x = player_obj.lastCheckpoint.x;
		player_obj.y = player_obj.lastCheckpoint.y - 64;
	}
	else
	{
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
}
