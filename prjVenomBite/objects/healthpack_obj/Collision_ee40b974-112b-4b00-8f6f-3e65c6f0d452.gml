/// @description Pickup

if (player_obj.hp < 100)
{
	if (player_obj.hp < 75)
	{
		player_obj.hp += 25;
		instance_destroy();
	}
	else
	{
		player_obj.hp = 100;
		instance_destroy();
	}
}
