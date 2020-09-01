/// @description Pickup

if (player_obj.maxhp < 100)
{
	player_obj.maxhp += 25;
	player_obj.hp += 25;
	player_obj.syringesLost -= 1;
	instance_destroy();
}
