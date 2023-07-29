//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

/// @description Check Player

if (distance_to_object(player_obj) < 48 && !dialogueTriggered)
{
	dialogueTriggered = true;
	dialogueSystem_obj.scene1 = true;
	player_obj.movement = false;
	camera_obj.drawBlackborders = true;
}
