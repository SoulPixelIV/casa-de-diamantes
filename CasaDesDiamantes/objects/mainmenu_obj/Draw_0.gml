draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);

if (file_exists("save1")) {
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(32, optionsY[0], "Continue");
} else {
	draw_set_color(make_color_rgb(110, 110, 110));
	draw_text(32, optionsY[0], "Continue");
}
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(32, optionsY[1], "New Game");
draw_text(32, optionsY[2], "Settings");
draw_text(32, optionsY[3], "Exit");

draw_set_halign(fa_right);
draw_text(global.xScreenSize - 24, global.yScreenSize - 16, "MAIN v.1.4.2");
draw_set_halign(fa_center);
//draw_text(global.xScreenSize / 2, global.yScreenSize - 16, "Mouse & Keyboard Recommended");
draw_set_halign(fa_left);

//Draw title
draw_sprite_ext(mainmenuTitle_spr, 0, global.xScreenSize / 2, 86, 1, 1, 0, -1, titleAlpha);

//Draw cursor
cursorImage += global.dt / 16;
if (!drawStartMenu) {
	draw_sprite(chipRed_spr, cursorImage, 20, optionsY[cursorPos] + 4);
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
	
	//Mouse Cursor Controls
	if (instance_exists(cursorHitbox_obj)) {
		for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
			var hitbox = instance_find(cursorHitbox_obj, i);
			if (instance_exists(hitbox)) {
				if (hitbox.open) {
					if (hitbox.index == 4 || hitbox.index == 5) {
						if (hitbox.index == 4) {
							startMenuElement = 0;
						}
						if (hitbox.index == 5) {
							startMenuElement = 1;
						}
				
						if (mouse_check_button_pressed(mb_left)) {
							if (!buttonBufferStart) {
								switch (startMenuElement)
								{
									case 0:
										//room_goto(transitionScreen);
										buttonBufferStart2 = true;
										startMenuElement = 1;
										drawStartMenu = false;
										drawSkipMenu = true;
									break;
									case 1:
										startMenuElement = 1;
										drawStartMenu = false;
									break;
								}
							}
						}
					}
				}
			}
		}
	}
	
	if (startMenuElement == 0) {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 - 72 - 42, global.yScreenSize / 2.5 + 16);
	} else {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 + 72 - 17, global.yScreenSize / 2.5 + 16);
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
				//room_goto(transitionScreen);
				buttonBufferStart2 = true;
				startMenuElement = 1;
				drawStartMenu = false;
				drawSkipMenu = true;
			} else {
				startMenuElement = 1;
				drawStartMenu = false;
			}
		}
	}
}

//Skip Window
if (drawSkipMenu) {
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2.5, 1, 0.79, 0, -1, 1);
	
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 - 45, "Skip Intro?");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 - 45, "Skip Intro?");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) - 72, global.yScreenSize / 2.5 + 12, "Yes");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 12, "Yes");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) + 72, global.yScreenSize / 2.5 + 12, "Don't Skip");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 12, "Don't Skip");
	draw_set_halign(fa_left);
	
	//Mouse Cursor Controls
	if (instance_exists(cursorHitbox_obj)) {
		for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
			var hitbox = instance_find(cursorHitbox_obj, i);
			if (instance_exists(hitbox)) {
				if (hitbox.open) {
					if (hitbox.index == 4 || hitbox.index == 5) {
						if (hitbox.index == 4) {
							startMenuElement = 0;
						}
						if (hitbox.index == 5) {
							startMenuElement = 1;
						}
				
						if (mouse_check_button_pressed(mb_left)) {
							if (buttonBuffer2 < 0) {
								switch (startMenuElement)
								{
									case 0:
										room_goto(level1);
										drawSkipMenu = false;
										buttonBuffer2 = buttonBufferSave2;
										buttonBufferStart2 = false;
									break;
									case 1:
										global.transitionScreenDest = level0;
										room_goto(transitionScreen);
										startMenuElement = 1;
										drawSkipMenu = false;
										buttonBuffer2 = buttonBufferSave2;
										buttonBufferStart2 = false;
									break;
								}
							}
						}
					}
				}
			}
		}
	}
	
	if (startMenuElement == 0) {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 - 72 - 21, global.yScreenSize / 2.5 + 16);
	} else {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 + 72 - 42, global.yScreenSize / 2.5 + 16);
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
	
	if (buttonBuffer2 < 0) {
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			if (startMenuElement == 0) {
				room_goto(level1);
				drawSkipMenu = false;
				buttonBuffer2 = buttonBufferSave2;
				buttonBufferStart2 = false;
			} else {
				global.transitionScreenDest = level0;
				room_goto(transitionScreen);
				startMenuElement = 1;
				drawSkipMenu = false;
				buttonBuffer2 = buttonBufferSave2;
				buttonBufferStart2 = false;
			}
		}
	}
}

if (buttonBufferStart2) {
	buttonBuffer2 -= global.dt;
}

//Cursor
if (inputMethod == 0) {
	draw_sprite(mousecursor_spr, 0, 
		(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
		window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
}