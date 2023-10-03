if (flicker && open)
{
	flickerTimer -= global.dt;

	if (flickerTimer < 0)
	{
		light[| eLight.Range] = Light_Range + random_range(Light_Range / 40, -(Light_Range / 40));
		flickerTimer = random_range(flickerTimerSave - flickerTimerSave / 15, flickerTimerSave + flickerTimerSave / 15);
	}
}

if (!open) {
	light[| eLight.Range] -= global.dt;
	turnoffTimer -= global.dt;
	
	if (turnoffTimer < 0) {
		instance_destroy();
	}
}
