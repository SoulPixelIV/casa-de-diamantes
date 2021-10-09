if (instance_exists(player_obj)) {
	if (player_obj.sprite_index == playerDash_spr || player_obj.sprite_index == playerDashNude_spr || player_obj.sprite_index == playerDashReverse_spr || player_obj.sprite_index == playerDashReverseNude_spr || player_obj.sprite_index == playerDashUnequippedNude_spr) {
		if (round(player_obj.y + 1) > y || player_obj.key_down_pressed) {
			mask_index = -1;
		} else {
			mask_index = colliderBox_spr;
		}
	} else {
		if (round(player_obj.y + 26) > y || player_obj.key_down_pressed) {
			mask_index = -1;
		} else {
			mask_index = colliderBox_spr;
		}
	}
}
