//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (open) {
	if (distance_to_object(player_obj > 600)) {
		y -= global.dt / 18;
	} else {
		y -= global.dt / 35;
	}
}
