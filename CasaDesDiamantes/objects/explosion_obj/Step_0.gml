/// @description Life Length

lifeLength -= global.dt;

if (lifeLength < 0)
{
	image_alpha -= global.dt / 30;
	lightStrength -= global.dt / 30;
}
if (image_alpha < 0.1)
{
	instance_destroy();
}
