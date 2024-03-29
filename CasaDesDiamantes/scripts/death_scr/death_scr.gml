function death_scr() {
	camera_obj.noZoom = true;
	camera_obj.deathVignette = true;
	camera_obj.noHUD = true;
	camera_obj.drawInfectionText = true;
	player_obj.movement = false;
	player_obj.radiation = 0;
	player_obj.inChamber = true;
	player_obj.gravityOn = false;
	player_obj.deathActivated = true;
}
