if (argument0)
{
	if (player_obj.horspeed > 0)
	{
		if (!player_obj.isDashing)
		{
			player_obj.horspeed -= player_obj.frictionStrength * player_obj.dt;
		}
		else
		{
			player_obj.horspeed -= (player_obj.frictionStrength * player_obj.dt) / 4;
		}
		if (player_obj.horspeed < 0.3)
		{
			player_obj.horspeed = 0;
		}
	}
	else
	{
		if (!player_obj.isDashing)
		{
			player_obj.horspeed += player_obj.frictionStrength * player_obj.dt;
		}
		else
		{
			player_obj.horspeed += (player_obj.frictionStrength * player_obj.dt) / 4;
		}
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
		if (!player_obj.isDashing)
		{
			player_obj.horspeed -= player_obj.dt;
		}
		else
		{
			player_obj.horspeed -= player_obj.dt / 4;
		}
		if (player_obj.horspeed < 0.3)
		{
			player_obj.horspeed = 0;
		}
	}
	else
	{
		if (!player_obj.isDashing)
		{
			player_obj.horspeed += player_obj.dt;
		}
		else
		{
			player_obj.horspeed += player_obj.dt / 4;
		}
		if (player_obj.horspeed > -0.3)
		{
			player_obj.horspeed = 0;
		}
	}
}