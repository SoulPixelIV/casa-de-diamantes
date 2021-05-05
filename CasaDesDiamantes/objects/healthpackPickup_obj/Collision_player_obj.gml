/// @description Pickup

if (player_obj.hp < player_obj.maxhp || player_obj.plagueTransformation)
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
	if (player_obj.plagueTransformation)
	{
		if (player_obj.infection > 25)
		{
			player_obj.infection -= 25;
		}
		else if (player_obj.infection <= 25)
		{
			player_obj.infection = 0;
		}
	}
}