//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (open) {
	if (distance_to_object(player_obj > 600)) {
		y -= global.dt / 25;
	} else {
		y -= global.dt / 70;
	}
}