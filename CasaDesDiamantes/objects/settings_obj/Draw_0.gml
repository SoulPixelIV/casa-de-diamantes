draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(32, optionsY[0], "Sound Volume [" + string(global.soundVolume) + "]");
draw_text(32, optionsY[1], "Music Volume [" + string(global.musicVolume) + "]");
draw_text(32, optionsY[2], "Maximum Framerate [" + string(globalSettings_obj.TARGET_FRAMERATE) + "]");
draw_text(32, optionsY[3], "Back to Main Menu");

draw_set_halign(fa_right);
draw_text(global.xScreenSize - 24, global.yScreenSize - 16, "PRE-DEMO v.0.12");
draw_set_halign(fa_left);

//Draw title
draw_sprite_ext(mainmenuTitle_spr, 0, global.xScreenSize / 2, 86, 1, 1, 0, -1, titleAlpha);

//Draw cursor
if (!drawStartMenu) {
	draw_sprite(chipRed_spr, -1, 20, optionsY[cursorPos] + 4);
}

//Start Window
if (drawStartMenu) {
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2.5, 1, 0.79, 0, -1, 1);
	
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 - 45, "Start a new Save File?");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 - 45, "Start a new Save File?");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) - 72, global.yScreenSize / 2.5 + 12, "Yes, Please!");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 12, "Yes, Please!");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) + 72, global.yScreenSize / 2.5 + 12, "No");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 12, "No");
	draw_set_halign(fa_left);
	
	if (startMenuElement == 0) {
		draw_sprite(chipRed_spr, -1, global.xScreenSize / 2 - 72 - 42, global.yScreenSize / 2.5 + 16);
	} else {
		draw_sprite(chipRed_spr, -1, global.xScreenSize / 2 + 72 - 17, global.yScreenSize / 2.5 + 16);
	}
	
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		if (startMenuElement == 0) {
			startMenuElement = 1;
		} else {
			startMenuElement = 0;
		}
	}
	
	if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
		if (startMenuElement == 1) {
			startMenuElement = 0;
		} else {
			startMenuElement = 1;
		}
	}
	
	if (!buttonBufferStart) {
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			if (startMenuElement == 0) {
				room_goto(transitionScreen);
			} else {
				startMenuElement = 1;
				drawStartMenu = false;
			}
		}
	}
}