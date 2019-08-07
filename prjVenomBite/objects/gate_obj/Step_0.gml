/// @description Open Door

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

if (open)
{
	if (y > goalY)
	{
		y -= dt;
	}
}
