/// @description Score

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

if (multiplierRun)
{
	global.multiplierTimer -= dt;
}
else
{
	global.multiplierTimer = 300;
}

if (global.multiplierTimer < 0)
{
	global.multiplier = 1;
	multiplierRun = false;
}
