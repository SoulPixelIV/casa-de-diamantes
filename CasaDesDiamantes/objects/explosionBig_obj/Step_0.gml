/// @description Life Length

sprite_index = explosion_spr;
	
lifeLength -= global.dt;

if (lifeLength < 0)
{
	image_alpha -= global.dt / 30;
	instance_destroy(light);
}

if (image_index > image_number - 1) 
{
	instance_destroy();
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;
