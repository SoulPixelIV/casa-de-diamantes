//Animation
image_speed = 0;
image_index += (global.dt / 15);

if (image_index > image_number - 1)
{
	instance_destroy();
}