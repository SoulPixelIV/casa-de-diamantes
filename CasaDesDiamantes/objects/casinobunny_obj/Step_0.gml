//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

/// @description Check Player
if (instance_exists(player_obj)) {
	if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) && !global.pause && !dialogueTriggered && player_obj.grounded)
	{
		dialogueSystem_obj.scene3 = true;	
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		dialogueTriggered = true;
	}
}
