/// @description Falling Script

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

if (falling)
{
	y += dt * 2;
}

if (!place_free(x, y))
{
    falling = false;
}