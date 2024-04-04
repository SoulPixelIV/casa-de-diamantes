function revive_scr() {
	camera_obj.noZoom = false;
	camera_obj.deathVignette = false;
	camera_obj.deathDelayTimer = camera_obj.deathDelayTimerSave;
	camera_obj.noHUD = false;
	camera_obj.drawInfectionText = false;
	camera_obj.deathFadeIn = 0;
	player_obj.movement = true;
	global.syringes -= 1;
	player_obj.syringesLost += 1;
	player_obj.infection = 0;
	player_obj.hp = 100;
	player_obj.deathActivated = false;
	player_obj.inChamber = false;
	player_obj.gravityOn = true;
	damageRecieved = true;
	
	player_obj.plagueTransformation = true;
	player_obj.y -= 36;
	camera_obj.showInfOverlay = true;
	
	if (instance_exists(vine_obj)) {
		instance_destroy(vine_obj);
	}
	if (instance_exists(playerVineDeath_obj)) {
		instance_destroy(playerVineDeath_obj);
	}
}
