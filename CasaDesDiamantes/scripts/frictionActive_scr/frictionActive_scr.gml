function frictionActive_scr(instance, frictionActive) {
	var currFriction = instance.frictionStrength * global.dt;
	var currFrictionDashing = (instance.frictionStrength / 3) * global.dt;
	
	if (frictionActive)
	{
		if (instance.horspeed > 0)
		{
			if (!instance.isDashing)
			{
				instance.horspeed -= currFriction;
				if (instance.key_right || instance.key_left)
				{
					if (!instance.jumping)
					{
						if (instance.horspeed > instance.movSpeed - 0.15)
						{
							instance.horspeed = instance.movSpeed;
						}
					}
				}
			}
			else
			{
				instance.horspeed -= currFrictionDashing;
			}
			if (instance.horspeed < 0.3)
			{
				instance.horspeed = 0;
			}
		}
		else
		{
			if (!instance.isDashing)
			{
				instance.horspeed += currFriction;
				if (instance.key_right || instance.key_left)
				{
					if (!instance.jumping)
					{
						if (instance.horspeed < -instance.movSpeed + 0.15)
						{
							instance.horspeed = -instance.movSpeed;
						}
					}
				}
			}
			else
			{
				instance.horspeed += currFrictionDashing;
			}
			if (instance.horspeed > -0.3)
			{
				instance.horspeed = 0;
			}
		}
	}
	else
	{
		if (instance.horspeed > 0)
		{
			if (!instance.isDashing)
			{
				instance.horspeed -= global.dt;
			}
			else
			{
				instance.horspeed -= global.dt / 3;
			}
			if (instance.horspeed < 0.3)
			{
				instance.horspeed = 0;
			}
		}
		else
		{
			if (!instance.isDashing)
			{
				instance.horspeed += global.dt;
			}
			else
			{
				instance.horspeed += global.dt / 3;
			}
			if (instance.horspeed > -0.3)
			{
				instance.horspeed = 0;
			}
		}
	}


}
