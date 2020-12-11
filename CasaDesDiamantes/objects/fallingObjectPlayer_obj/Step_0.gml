/// @description Falling Script

if (falling)
{
	y += global.dt * 2;
	image_alpha -= global.dt / 5
}

if (image_alpha < 0.05)
{
	instance_destroy();
}