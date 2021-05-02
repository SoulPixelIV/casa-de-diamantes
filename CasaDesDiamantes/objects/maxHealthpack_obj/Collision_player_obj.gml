/// @description Pickup

if (player_obj.hp < player_obj.maxhp)
{
	player_obj.hp = player_obj.maxhp;
	instance_destroy();
}
