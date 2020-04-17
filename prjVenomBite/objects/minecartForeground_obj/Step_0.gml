if (inMinecart)
{
	player_obj.movement = false;
	player_obj.invincible = true;

	player_obj.x = x;
	player_obj.y = y - 26;
}
/*
if (keyboard_check_pressed(vk_space))
{
	inMinecart = false;
	player_obj.movement = true;
	player_obj.invincible = false;
	player_obj.x = x - 64;
	player_obj.y = y - 32;
}
	
*/