function revive_scr() {
	camera_obj.noZoom = false;
	camera_obj.deathVignette = false;
	camera_obj.noHUD = false;
	camera_obj.drawInfectionText = false;
	player_obj.movement = true;
	global.syringes -= 1;
	player_obj.syringesLost += 1;
	player_obj.hp = 100;
	player_obj.deathActivated = false;
	reload_scr();
	
	player_obj.plagueTransformation = true;
	camera_obj.showInfOverlay = true;
}
