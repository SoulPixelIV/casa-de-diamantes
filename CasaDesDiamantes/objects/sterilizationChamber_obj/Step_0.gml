//Animation
image_speed = 0;
image_index += (global.dt / 30) * animationSpeed;

if (distance_to_object(player_obj) < 32 && (keyboard_check_pressed(ord("W")) || gamepad_button_check(4, gp_padu) || gamepad_button_check(0, gp_padu)) && !sterilization && player_obj.plagueTransformation && player_obj.hp > 0) {
	sterilization = true;
	player_obj.movement = false;
	player_obj.image_alpha = 0;
	player_obj.invincible = true;
	player_obj.inChamber = true;
	
	player_obj.plagueTransformation = false;
	if (instance_exists(camera_obj)) {
		camera_obj.hazeEffect = false;
	}
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

if (sterilization) {
	sterilizationTimer -= global.dt;
}

if (sterilizationTimer < 0) {
	camera_obj.showInfectionHealedText = true;
	
	player_obj.movement = true;
	player_obj.invincible = false;
	player_obj.image_alpha = 1;
	player_obj.inChamber = false;
	
	part_emitter_burst(global.partSystem, smokeEmitter, global.smokePart, 38);
	
	sterilizationTimer = sterilizationTimerSave;
	sterilization = false;
}




