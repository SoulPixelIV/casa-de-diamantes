/// @description Pickup

if (player_obj.hp < player_obj.maxhp)
{
	if (player_obj.hp < player_obj.maxhp - 25)
	{
		player_obj.hp += 25;
		instance_destroy();
	}
	else
	{
		player_obj.hp = player_obj.maxhp;
		instance_destroy();
	}
}
