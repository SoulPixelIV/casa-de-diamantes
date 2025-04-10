//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (global.storyAct != 2) {
	instance_destroy();
}

if (!global.dialogueDelayStart) {
	if (distance_to_object(player_obj) < 64 && !dialogueTriggered && player_obj.key_up_pressed && !global.pause && player_obj.grounded) {		
		global.dialogueDelayStart = true;
		dialogueTriggered = true;
		dialogueSystem_obj.scene36 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
	}
}