if (instance_exists(camera_obj)) {
	x = camera_obj.x - global.xScreenSize / 2;
	y = camera_obj.y - global.yScreenSize / 2;
}

if (open) {
	if (image_alpha < 1) {
		image_alpha += global.dt / 30;
	} else {
		if (instance_exists(backgroundCasinoConsumed_obj)) {
			backgroundCasinoConsumed_obj.image_alpha = 1;
		}
	}
	startDelay -= global.dt;
}

if (startDelay < 0) {
	open = false;
	if (image_alpha > 0) {
		image_alpha -= global.dt / 700;
	} else {
		dialogueDelay -= global.dt;
		
		if (dialogueDelay < 0) {
			if (!global.dialogueDelayStart && !global.finalRoomDialogue2) {
				if (!global.pause && !dialogueTriggered) {
					global.dialogueDelayStart = true;
					dialogueTriggered = true;
					dialogueSystem_obj.scene47 = true;
					player_obj.movement = false;
					camera_obj.drawBlackborders = true;
				}
			}
		}
	}
}
