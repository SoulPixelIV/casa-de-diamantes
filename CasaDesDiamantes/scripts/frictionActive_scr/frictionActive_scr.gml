function frictionActive_scr(instance, frictionActive) {
	var currFriction = instance.frictionStrength;
	var currFrictionDashing = (instance.frictionStrength / 2.25);
	
	if (frictionActive)
	{
		if (instance.horspeed > 0)
		{
			if (!instance.isDashing)
			{
				if (grounded)
				{
					instance.horspeed -= currFriction;
				}
			}
			else
			{
				instance.horspeed -= currFrictionDashing;
			}
			if (instance.horspeed < 0.02)
			{
				instance.horspeed = 0;
			}
		}
		else
		{
			if (!instance.isDashing)
			{
				if (grounded)
				{
					instance.horspeed += currFriction;
				}
			}
			else
			{
				instance.horspeed += currFrictionDashing;
			}
			if (instance.horspeed > -0.02)
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
				if (grounded)
				{
					instance.horspeed -= global.dt;
				}
			}
			else
			{
				instance.horspeed -= global.dt / 3;
			}
			if (instance.horspeed < 0.02)
			{
				instance.horspeed = 0;
			}
		}
		else
		{
			if (!instance.isDashing)
			{
				if (grounded)
				{
					instance.horspeed += global.dt;
				}
			}
			else
			{
				instance.horspeed += global.dt / 3;
			}
			if (instance.horspeed > -0.02)
			{
				instance.horspeed = 0;
			}
		}
	}


}
