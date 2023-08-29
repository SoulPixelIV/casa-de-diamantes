//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (distance_to_object(player_obj) < 32 && !dialogueTriggered && player_obj.key_up_pressed && !global.pause)
{
	dialogueSystem_obj.scene1 = true;
	player_obj.movement = false;
	camera_obj.drawBlackborders = true;
}
