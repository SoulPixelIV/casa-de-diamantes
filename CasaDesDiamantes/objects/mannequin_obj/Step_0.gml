if (distance_to_object(player_obj) > 32) {
	camera_obj.mannequinMessage1 = false;
	camera_obj.mannequinMessage2 = false;
} else {
	if (global.boughtSkin1) {
		camera_obj.mannequinMessage2 = true;
		camera_obj.mannequinMessage1 = false;
	} else {
		camera_obj.mannequinMessage1 = true;
		camera_obj.mannequinMessage2 = false;
	}
}

if (instance_exists(player_obj)) {
	if (distance_to_object(player_obj) < 64 && !global.pause) {
		if (keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(4, gp_padu) || gamepad_button_check_pressed(0, gp_padu)) {
			if (!global.boughtSkin1) {
				if (global.diamonds >= 2) {
					audio_play_sound(buying_snd, 1, false);
					global.diamonds -= 2;
					global.boughtSkin1 = true;
					global.skin = 1;
				}
			} else {
				if (global.skin == 0) {
					global.skin = 1;
				} else {
					global.skin = 0;
				}
			}
		}
	}
}