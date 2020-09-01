if (argument1)
{
	if (argument0.horspeed > 0)
	{
		if (!argument0.isDashing)
		{
			argument0.horspeed -= argument0.frictionStrength * global.dt;
		}
		else
		{
			argument0.horspeed -= (argument0.frictionStrength * global.dt) / 3;
		}
		if (argument0.horspeed < 0.3)
		{
			argument0.horspeed = 0;
		}
	}
	else
	{
		if (!argument0.isDashing)
		{
			argument0.horspeed += argument0.frictionStrength * global.dt;
		}
		else
		{
			argument0.horspeed += (argument0.frictionStrength * global.dt) / 3;
		}
		if (argument0.horspeed > -0.3)
		{
			argument0.horspeed = 0;
		}
	}
}
else
{
	if (argument0.horspeed > 0)
	{
		if (!argument0.isDashing)
		{
			argument0.horspeed -= global.dt;
		}
		else
		{
			argument0.horspeed -= global.dt / 3;
		}
		if (argument0.horspeed < 0.3)
		{
			argument0.horspeed = 0;
		}
	}
	else
	{
		if (!argument0.isDashing)
		{
			argument0.horspeed += global.dt;
		}
		else
		{
			argument0.horspeed += global.dt / 3;
		}
		if (argument0.horspeed > -0.3)
		{
			argument0.horspeed = 0;
		}
	}
}