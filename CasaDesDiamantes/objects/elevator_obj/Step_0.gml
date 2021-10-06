/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) && !used)
{
	sprite_index = elevatorOpening_spr;
	used = true;
}

if (image_index == image_number - 1) {
	image_index = image_number - 1;
	image_speed = 0;
}

//Animation
if (image_index < image_number - 1) {
	image_speed = 0;
	image_index += (global.dt / 15) * animationSpeed;
}