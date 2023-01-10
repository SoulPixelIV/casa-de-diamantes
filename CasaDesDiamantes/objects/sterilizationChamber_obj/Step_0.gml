if (distance_to_object(player_obj) < 32 && keyboard_check_pressed(ord("W"))) {
	sterilization = true;
	player_obj.movement = false;
	player_obj.image_alpha = 0;
	player_obj.invincible = true;
	image_index = 1;
}

if (sterilization) {
	sterilizationTimer -= global.dt;
}

if (sterilizationTimer < 0) {
	camera_obj.showInfectionHealedText = true;
	
	player_obj.movement = true;
	player_obj.invincible = false;
	player_obj.image_alpha = 1;
	image_index = 0;
	
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
	
	part_emitter_burst(global.partSystem, smokeEmitter, global.smokePart, 45);
	
	sterilizationTimer = sterilizationTimerSave;
	sterilization = false;
}




