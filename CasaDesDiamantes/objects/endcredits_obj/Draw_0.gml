if (open) {
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(make_color_rgb(255, 255, 255));
	draw_set_alpha(imAlpha);
	if (name == 0) {
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Made by William Djalal");
	}
	if (name == 1) {
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Music & SFX by\nThomas Hitchcock\nCordele Glass");
	}
	if (name == 2) {
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Art & Design by\nWilliam Djalal\nJana Lel\nEmilia Rzepka");
	}
	if (name == 3) {
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Support by \nChristopher Grunzke\nEmilia Rzepka\nJana Lel\nAlkan Akarsu");
	}
	if (name == 4) {
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Thank you for playing!");
	}

	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(4, gp_start) || keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_left)) {
		if (pressDelay < 0) {
			if (name == 0) {
				name = 1;
				timer = 8000;
			}
			else if (name == 1) {
				name = 2;
				timer = 6000;
			}
			else if (name == 2) {
				name = 3;
				timer = 4000;
			}
			else if (name == 3) {
				name = 4;
				timer = 2000;
			}
			else if (name == 4) {
				name = 5;
				timer = 0;
			}
			pressDelay = 70;
		}
	}

	pressDelay -= global.dt;

	if (startDelay < 0 ) {
		timer -= global.dt;
	}

	startDelay -= global.dt;

	if (timer < 8000) {
		if (name == 0) {
			name = 1;
		}
	}
	if (timer < 6000) {
		if (name == 1) {
			name = 2;
		}
	}
	if (timer < 4000) {
		if (name == 2) {
			name = 3;
		}
	}
	if (timer < 2000) {
		if (name == 3) {
			name = 4;
		}
	}
	if (timer < 0) {
		room_goto(credits);
	}

	if (imAlpha < 1) {
		imAlpha += global.dt / 50;
	}
}
