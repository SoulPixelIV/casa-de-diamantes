//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (open) {
	sprite_index = komoConsumed_spr;
	startDialogueDelay = true;
	repeat(2) {
		var vine = instance_create_layer(x, y, "BackgroundObjects", vine_obj);
		vine.image_angle = random_range(0, 359);
		vine.growSpeed = random_range(0.8, 1.2);
	}
	open = false;
}

if (startDialogueDelay) {
	startDialogueDelayTimer -= global.dt;
	
	if (startDialogueDelayTimer < 0) {
		if (!global.dialogueDelayStart && !global.finalRoomDialogue3) {
			if (!global.pause && !dialogueTriggered) {
				global.dialogueDelayStart = true;
				dialogueTriggered = true;
				dialogueSystem_obj.scene48 = true;
				player_obj.movement = false;
				camera_obj.drawBlackborders = true;
			}
		}
		escapeDelay -= global.dt;
	}
}

if (escapeDelay < 0) {
	if (instance_exists(blacksquare_obj)) {
		blacksquare_obj.open = true;
		escapeDelay = 9999999999;
	}
}