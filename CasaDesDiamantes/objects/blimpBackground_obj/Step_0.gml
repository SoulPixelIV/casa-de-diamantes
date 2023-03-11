//Movement
if (dir == 0)
{
	verspeed = speedVer;
	if (movTimer < 0)
	{
		dir = 1;
		movTimer = movTimerSave;
	}
}
else
{
	verspeed = -speedVer;
	if (movTimer < 0)
	{
		dir = 0;
		movTimer = movTimerSave;
	}
}

movTimer -= global.dt;

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

y += verspeed * global.dt;
dest += horspeed * global.dt;