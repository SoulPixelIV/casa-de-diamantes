if (!player_obj.deathActivated) {
	player_obj.plagueTransformation = true;
	camera_obj.showInfOverlay = true;
} else {
	player_obj.plagueTransformation = false;
	camera_obj.showInfOverlay = false;
}
