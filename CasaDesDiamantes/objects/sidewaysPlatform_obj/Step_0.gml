x += horspeed * global.dt;

moveTimer -= global.dt;

if (moveTimer < 0)
{
	if (dir == 0)
	{
		dir = 1;
	}
	else
	{
		dir = 0;
	}
	moveTimer = moveTimerSave;
}

if (dir == 0)
{
	horspeed = horVelocity;
}
else
{
	horspeed = -horVelocity;
}
