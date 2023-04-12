if (!drawStartMenu) {
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
	{
		if (cursorPos > 0)
		{
			cursorPos--;
		}
		else
		{
			cursorPos = array_length(optionsY) - 1;
		}
	}
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd))
	{
		if (cursorPos < array_length(optionsY) - 1)
		{
			cursorPos++;
		}
		else
		{
			cursorPos = 0;
		}
	}

	if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr))
	{
		switch (cursorPos)
		{
			case 0:
				if (global.soundVolume < 100) {
					global.soundVolume += 10;
				}
			break;
			case 1:
				if (global.musicVolume < 100) {
					global.musicVolume += 10;
				}
			break;
			case 2:
				if (globalSettings_obj.TARGET_FRAMERATE == 60) {
					globalSettings_obj.TARGET_FRAMERATE = 120;
					game_set_speed(globalSettings_obj.TARGET_FRAMERATE, gamespeed_fps);
				} else if (globalSettings_obj.TARGET_FRAMERATE == 120) {
					globalSettings_obj.TARGET_FRAMERATE = 144;
					game_set_speed(globalSettings_obj.TARGET_FRAMERATE, gamespeed_fps);
				}
			break;
			case 3:
				global.speedrunTimer = !global.speedrunTimer;
			break;
		}
		saveSettings_scr();
	}
	
	if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl))
	{
		switch (cursorPos)
		{
			case 0:
				if (global.soundVolume > 0) {
					global.soundVolume -= 10;
				}
			break;
			case 1:
				if (global.musicVolume > 0) {
					global.musicVolume -= 10;
				}
			break;
			case 2:
				if (globalSettings_obj.TARGET_FRAMERATE == 144) {
					globalSettings_obj.TARGET_FRAMERATE = 120;
					game_set_speed(globalSettings_obj.TARGET_FRAMERATE, gamespeed_fps);
				} else if (globalSettings_obj.TARGET_FRAMERATE == 120) {
					globalSettings_obj.TARGET_FRAMERATE = 60;
					game_set_speed(globalSettings_obj.TARGET_FRAMERATE, gamespeed_fps);
				}
			break;
			case 3:
				global.speedrunTimer = !global.speedrunTimer;
			break;
		}
		saveSettings_scr();
	}
}

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2)) {
	saveSettings_scr();
	room_goto(mainmenu);
}

if (titleAlpha < 1) {
	titleAlpha += global.dt / 200;
}

if (buttonBufferStart) {
	buttonBuffer -= global.dt;
}

if (buttonBuffer < 0) {
	buttonBufferStart = false;
	buttonBuffer = buttonBufferSave;
}