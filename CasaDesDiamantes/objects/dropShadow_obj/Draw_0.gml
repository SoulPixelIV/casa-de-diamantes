if (instance_exists(player_obj)) {
	if (instance_exists(camera_obj)) {
		if (place_meeting(x, y + 8, collider_obj) && !player_obj.huggingWall && !camera_obj.finalDeath && !player_obj.deathActivated && !player_obj.inChamber) {
			draw_self();
		}
	}
}
