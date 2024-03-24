if (instance_exists(player_obj)) {
	if (place_meeting(x, y + 8, collider_obj) && !player_obj.huggingWall) {
		draw_self();
	}
}
