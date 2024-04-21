//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

/// @description Check Player
if (!global.dialogueDelayStart) {
	if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) && !global.pause && !camera_obj.showWindowMenu && !dialogueTriggered && player_obj.grounded && !global.dialogueDelayStart)
	{
		global.dialogueDelayStart = true;
		dialogueSystem_obj.scene2 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		dialogueTriggered = true;
	}
}
