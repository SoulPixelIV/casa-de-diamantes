/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed))
{
	dialogueSystem_obj.scene1 = true;
}