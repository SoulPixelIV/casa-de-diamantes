dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

if (!dir)
{
	light[| eLight.X] += dt;
}
else
{
	light[| eLight.X] -= dt;
}
timer -= dt;

if (timer < 0)
{
	timer = 100;
	dir = !dir;
}