if (instance_exists(player_obj)) {
	//DASH
	if (player_obj.isDashing) {
		if (round(player_obj.y + 19) > y || player_obj.key_down_pressed) {
			mask_index = -1;
		} else {
			mask_index = colliderBox_spr;
		}
	} else {
	//TURN OFF COLLIDER IF PLAYER BELOW PLATFORM
		if (round(player_obj.y + 31) > y || player_obj.key_down_pressed) {
			mask_index = -1;
		} else {
			mask_index = colliderBox_spr;
		}
	}
}
