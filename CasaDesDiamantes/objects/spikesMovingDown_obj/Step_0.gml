//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (open) {
	if (instance_exists(player_obj)) {
		if (!even) {
			if (distance_to_object(player_obj) > 200) {
				y += global.dt / 1.5;
			} else if (distance_to_object(player_obj) > 80) {
				y += global.dt / 3;
			} else {
				y += global.dt / 5.5;
			}
		} else {
			y += global.dt / 5.5;
		}
	}
}
