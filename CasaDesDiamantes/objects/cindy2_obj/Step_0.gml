//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!global.introDialogueCindyDone) {
	if (distance_to_object(player_obj) < 48 && !dialogueTriggered && player_obj.key_up_pressed && !global.pause && player_obj.grounded)
	{
		dialogueSystem_obj.scene4 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		dialogueTriggered = true;
	}
} else {
	if (distance_to_object(player_obj) < 48 && !dialogueTriggered && player_obj.key_up_pressed && !global.pause && player_obj.grounded)
	{
		dialogueSystem_obj.scene6 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		dialogueTriggered = true;
	}
}
