if (argument0)
{
	if (player_obj.horspeed > 0)
	{
		player_obj.horspeed -= player_obj.frictionStrength * player_obj.dt;
		if (player_obj.horspeed < 0.3)
		{
			player_obj.horspeed = 0;
		}
	}
	else
	{
		player_obj.horspeed += player_obj.frictionStrength * player_obj.dt;
		if (player_obj.horspeed > -0.3)
		{
			player_obj.horspeed = 0;
		}
	}
}
else
{
	if (player_obj.horspeed > 0)
	{
		player_obj.horspeed -= player_obj.dt;
		if (player_obj.horspeed < 0.3)
		{
			player_obj.horspeed = 0;
		}
	}
	else
	{
		player_obj.horspeed += player_obj.dt;
		if (player_obj.horspeed > -0.3)
		{
			player_obj.horspeed = 0;
		}
	}
}