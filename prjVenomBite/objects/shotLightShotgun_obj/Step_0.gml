/// @description Life Length

lifeLength -= global.dt / 3;

if (lifeLength < 0)
{
	image_alpha -= global.dt / 30;
	lightStrength -= global.dt / 30;
}
if (image_alpha == 0)
{
	instance_destroy();
}
