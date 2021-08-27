if (flicker)
{
	flickerTimer -= global.dt;

	if (flickerTimer < 0)
	{
		light[| eLight.Range] = Light_Range + random_range(Light_Range / 40, -(Light_Range / 40));
		flickerTimer = random_range(flickerTimerSave - flickerTimerSave / 15, flickerTimerSave + flickerTimerSave / 15);
	}
}