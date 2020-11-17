x += horspeed * global.dt;

moveTimer -= global.dt;

if (moveTimer < 0)
{
	dir = -dir;
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
