//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

/// @description Check Player

if ((distance_to_object(player_obj) < 32 && keyboard_check_pressed(ord("W"))))
{
	dialogueSystem_obj.scene2 = true;
}
