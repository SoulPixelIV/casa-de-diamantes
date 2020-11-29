/// @description Check Player

if ((distance_to_object(player_obj) < 32 && keyboard_check_pressed(ord("W"))))
{
	dialogueSystem_obj.scene1 = true;
}