function revive_scr() {
	camera_obj.noZoom = false;
	camera_obj.deathVignette = false;
	camera_obj.noHUD = false;
	camera_obj.drawInfectionText = false;
	player_obj.movement = true;
	player_obj.syringes -= 1;
	player_obj.syringesLost += 1;
	player_obj.hp = 100 - 25 * player_obj.syringesLost;
	player_obj.maxhp -= 25;
	player_obj.deathActivated = false;
	
	player_obj.plagueTransformation = true;
	camera_obj.showInfOverlay = true;
}
