/// @description Life Length

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
lifeLength -= dt;

if (lifeLength < 0)
{
	image_alpha -= dt / 10;
	lightStrength -= dt / 10;
}
if (image_alpha == 0)
{
	instance_destroy();
}
