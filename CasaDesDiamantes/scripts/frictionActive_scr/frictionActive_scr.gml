function frictionActive_scr(argument0, argument1) {
	if (argument1)
	{
		if (argument0.horspeed > 0)
		{
			if (!argument0.isDashing)
			{
				argument0.horspeed -= argument0.frictionStrength * global.dt;
				if (argument0.key_right || argument0.key_left)
				{
					if (!argument0.jumping)
					{
						if (argument0.horspeed > argument0.movSpeed - 0.15)
						{
							argument0.horspeed = argument0.movSpeed;
						}
					}
				}
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
				if (argument0.key_right || argument0.key_left)
				{
					if (!argument0.jumping)
					{
						if (argument0.horspeed < -argument0.movSpeed + 0.15)
						{
							argument0.horspeed = -argument0.movSpeed;
						}
					}
				}
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


}
