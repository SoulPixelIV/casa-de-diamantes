draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 215, 0));
draw_set_alpha(imAlpha);
if (name == 0) {
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "A Videogame by\nWilliam Djalal - SoulPixelIV");
}
if (name == 1) {
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Music & SFX by\nThomas Hitchcock\nCordele Glass");
}
if (name == 2) {
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Art & Design by\nJana Lel\nEmilia Rzepka");
}
if (name == 3) {
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Playtesting by \nAlkan Akarsu\nEmilia Rzepka\nJana Lel");
}
if (name == 4) {
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Mouse & Keyboard Recommended");
}

if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(4, gp_start) || keyboard_check_pressed(vk_escape)) {
	if (pressDelay < 0) {
		if (name == 0) {
			name = 1;
			timer = 4300;
		}
		else if (name == 1) {
			name = 2;
			timer = 3600;
		}
		else if (name == 2) {
			name = 3;
			timer = 2900;
		}
		else if (name == 3) {
			name = 4;
			timer = 2200;
		}
		else if (name == 4) {
			name = 5;
			timer = 1700;
		}
		pressDelay = 70;
	}
}

pressDelay -= global.dt;

if (startDelay < 0 ) {
	timer -= global.dt;
}

startDelay -= global.dt;

if (timer < 4300) {
	if (name == 0) {
		name = 1;
	}
}
if (timer < 3600) {
	if (name == 1) {
		name = 2;
	}
}
if (timer < 2900) {
	if (name == 2) {
		name = 3;
	}
}
if (timer < 2200) {
	if (name == 3) {
		name = 4;
	}
}
if (timer < 1700) {
	room_goto(mainmenu);
}

if (imAlpha < 1) {
	imAlpha += global.dt / 50;
}
