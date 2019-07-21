/// @description Life Length

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
lifeLength -= dt;

if (lifeLength < 0)
{
	image_alpha -= 0.025;
	lightStrength -= 0.025;
}
if (image_alpha == 0)
{
	instance_destroy();
}
