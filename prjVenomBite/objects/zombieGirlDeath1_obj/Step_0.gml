//Animation

image_speed = 0;

if (image_index > image_number - 1)
{
	image_alpha -= global.dt / 300;
}
else
{
	image_index += global.dt / 25;
}

if (image_alpha < 0.05)
{
	instance_destroy();
}
