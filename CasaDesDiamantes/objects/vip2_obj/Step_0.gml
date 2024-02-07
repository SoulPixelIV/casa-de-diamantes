//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

/// @description Check Player
if (instance_exists(player_obj)) {
	if (distance_to_object(player_obj) < 82 && !global.pause && !dialogueTriggered && player_obj.grounded) {
		dialogueTriggered = true;
		dialogueSystem_obj.scene8 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		if (instance_exists(col)) {
			instance_destroy(col);
		}
	}
}
