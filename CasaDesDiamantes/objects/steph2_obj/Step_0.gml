//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (instance_exists(player_obj)) {
	player_obj.movement = false;
}