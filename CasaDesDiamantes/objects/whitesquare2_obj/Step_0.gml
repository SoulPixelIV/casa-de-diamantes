if (instance_exists(camera_obj)) {
	x = camera_obj.x - global.xScreenSize / 2;
	y = camera_obj.y - global.yScreenSize / 2;
}

startDelay -= global.dt;

if (startDelay < 0) {
	if (image_alpha > 0) {
		image_alpha -= global.dt / 1000;
	} else {
		if (!global.dialogueDelayStart && !global.finalRoomDialogue1) {
			if (!global.pause && !dialogueTriggered) {
				global.dialogueDelayStart = true;
				dialogueTriggered = true;
				dialogueSystem_obj.scene46 = true;
				player_obj.movement = false;
				camera_obj.drawBlackborders = true;
			}
		}
	}
}
