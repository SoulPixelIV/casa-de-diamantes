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
