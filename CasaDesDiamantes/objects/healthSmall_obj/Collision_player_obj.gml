/// @description Pickup

if (player_obj.hp < player_obj.maxhp || player_obj.plagueTransformation)
{
	audio_play_sound(healthPickup_snd, 1, false);
	if (player_obj.hp < player_obj.maxhp - 5)
	{
		player_obj.hp += 5;
		instance_destroy();
	}
	else
	{
		player_obj.hp = player_obj.maxhp;
		instance_destroy();
	}
	if (player_obj.plagueTransformation)
	{
		if (player_obj.infection > 5)
		{
			player_obj.infection -= 5;
		}
		else if (player_obj.infection <= 5)
		{
			player_obj.infection = 0;
		}
	}
}
