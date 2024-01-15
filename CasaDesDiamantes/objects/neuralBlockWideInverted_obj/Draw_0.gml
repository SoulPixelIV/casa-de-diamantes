draw_self();
if (distance_to_object(player_obj) < distVisible) {
	if (image_alpha > 0) {
		image_alpha -= global.dt / 90;
	}
} else {
	if (image_alpha < 1) {
		image_alpha += global.dt / 90;
	}
}
