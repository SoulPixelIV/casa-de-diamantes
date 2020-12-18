function frictionActive_scr(instance) {
	var currFriction = instance.frictionStrength * global.dt;
	var currFrictionDashing = (instance.frictionStrength / 3) * global.dt;
	
	if (instance.horspeed > 0)
	{
		if (!instance.isDashing)
		{
			if ((grounded && instance.horspeed != instance.movSpeed) || instance.onLadder)
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
			if (grounded && instance.horspeed != -instance.movSpeed || instance.onLadder)
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
