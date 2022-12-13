lightrayRotation += global.dt / 3;

if (dir == 0)
{
	y -= global.dt / 60;
}
else
{
	y += global.dt / 60;
}

switchTimer -= global.dt;
if (switchTimer < 0)
{
	if (dir == 0)
	{
		dir = 1;
	}
	else
	{
		dir = 0;
	}
	switchTimer = switchTimerSave;
}

if (horspeed > 0)
{
	horspeed -= 0.002 * global.dt / 3;

	if (horspeed < 0.3)
	{
		horspeed = 0;
	}
}
else
{

	horspeed += 0.002 * global.dt / 3;

	if (horspeed > -0.3)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 4)
{
	verspeed -= gravityStrength * global.dt / 3;
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    horspeed = 0;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    verspeed = 0;   
}

x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;