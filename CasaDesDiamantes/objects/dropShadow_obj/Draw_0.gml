if (instance_exists(player_obj)) {
	if (instance_exists(camera_obj)) {
		if (place_meeting(x, y + 8, collider_obj) && !player_obj.huggingWall && !camera_obj.finalDeath && !player_obj.deathActivated && !player_obj.inChamber) {
			draw_self();
		}
	}
	
	if (player_obj.sittingInMinecart) {
		image_alpha = 0;
	} else {
		image_alpha = 1;
	}
}
