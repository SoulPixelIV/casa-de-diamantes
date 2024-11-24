/// @description Life Length

lifeLength -= global.dt;

if (lifeLength < 0)
{
	image_alpha -= global.dt / 30;
}

if (image_index < image_number - 1) 
{
	//Animation
	image_speed = 0;
	image_index += (global.dt / 15) * animationSpeed;
} else {
	if (image_alpha < 0.05) {
		instance_destroy();
	}
}