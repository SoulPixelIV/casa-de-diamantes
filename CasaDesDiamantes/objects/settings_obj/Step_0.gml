//Check for Controller or Keyboard
if (gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1)
 || gamepad_axis_value(4, gp_axislh) < -0.4 || gamepad_axis_value(0, gp_axislh) < -0.4
  || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
   || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
    || gamepad_button_check(4, gp_padd) || gamepad_axis_value(4, gp_axislv) > 0.4 || gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.4
	 || gamepad_button_check_pressed(4, gp_shoulderrb) || gamepad_button_check_pressed(0, gp_shoulderrb)
	  || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2)
	   || gamepad_button_check_pressed(4, gp_face3) || gamepad_button_check_pressed(0, gp_face3)
	    || gamepad_button_check(4, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderlb)
		 || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start))
{
	inputMethod = 1;
}
else if (keyboard_check_pressed(vk_anykey))
{
	inputMethod = 0;
}

//Mouse Cursor Controls
if (instance_exists(cursorHitbox_obj)) {
	for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
		var hitbox = instance_find(cursorHitbox_obj, i);
		if (instance_exists(hitbox)) {
			if (hitbox.open) {
				cursorPos = hitbox.index;
				
				if (mouse_check_button_pressed(mb_left)) {
					audio_play_sound(typewriterPush_snd, 1, false);
					switch (cursorPos)
					{
						case 0:
						break;
						case 1:
						break;
						case 2:
							if (global.gamma == 1.4) {
								global.gamma = 1.6;
							} else if (global.gamma == 1.6) {
								global.gamma = 1.8;
							} else if (global.gamma == 1.8) {
								global.gamma = 2;
							} else if (global.gamma == 2) {
								global.gamma = 2.2;
							} else if (global.gamma == 2.2) {
								global.gamma = 2.4;
							} else if (global.gamma == 2.4) {
								global.gamma = 0.2;
							} else if (global.gamma == 0.2) {
								global.gamma = 0.4;
							} else if (global.gamma == 0.4) {
								global.gamma = 0.6;
							} else if (global.gamma == 0.6) {
								global.gamma = 0.8;
							} else if (global.gamma == 0.8) {
								global.gamma = 1;
							} else if (global.gamma == 1) {
								global.gamma = 1.2;
							} else if (global.gamma == 1.2) {
								global.gamma = 1.4;
							}
						break;
						case 3:
							if (window_get_fullscreen()) {
								window_set_fullscreen(false);
								window_set_size(xScreenSize*3, yScreenSize*3);
								surface_resize(application_surface, xScreenSize, yScreenSize);
								display_set_gui_size(xScreenSize, yScreenSize);
							} else {
								window_set_fullscreen(true);
							}
						break;
						case 4:
							room_goto(mainmenu);
						break;
					}
					saveSettings_scr();
				}
			}
		}
	}
}

if (!drawStartMenu) {
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
	{
		audio_play_sound(typewriter_snd, 1, false);
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
		audio_play_sound(typewriter_snd, 1, false);
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
		audio_play_sound(typewriter_snd, 1, false);
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
				if (global.gamma == 1.4) {
					global.gamma = 1.6;
				} else if (global.gamma == 1.6) {
					global.gamma = 1.8;
				} else if (global.gamma == 1.8) {
					global.gamma = 2;
				} else if (global.gamma == 2) {
					global.gamma = 2.2;
				} else if (global.gamma == 2.2) {
					global.gamma = 2.4;
				} else if (global.gamma == 2.4) {
					global.gamma = 0.2;
				} else if (global.gamma == 0.2) {
					global.gamma = 0.4;
				} else if (global.gamma == 0.4) {
					global.gamma = 0.6;
				} else if (global.gamma == 0.6) {
					global.gamma = 0.8;
				} else if (global.gamma == 0.8) {
					global.gamma = 1;
				} else if (global.gamma == 1) {
					global.gamma = 1.2;
				} else if (global.gamma == 1.2) {
					global.gamma = 1.4;
				}
			break;
			case 3:
			break;
		}
		saveSettings_scr();
	}
	
	if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl))
	{
		audio_play_sound(typewriter_snd, 1, false);
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
				if (global.gamma == 1.4) {
					global.gamma = 1.2;
				} else if (global.gamma == 1.2) {
					global.gamma = 1;
				} else if (global.gamma == 1) {
					global.gamma = 0.8;
				} else if (global.gamma == 0.8) {
					global.gamma = 0.6;
				} else if (global.gamma == 0.6) {
					global.gamma = 0.4;
				} else if (global.gamma == 0.4) {
					global.gamma = 0.2;
				} else if (global.gamma == 0.2) {
					global.gamma = 2.4;
				} else if (global.gamma == 2.4) {
					global.gamma = 2.2;
				} else if (global.gamma == 2.2) {
					global.gamma = 2;
				} else if (global.gamma == 2) {
					global.gamma = 1.8;
				} else if (global.gamma == 1.8) {
					global.gamma = 1.6;
				} else if (global.gamma == 1.6) {
					global.gamma = 1.4;
				}
			break;
			case 3:
			break;
		}
		saveSettings_scr();
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		audio_play_sound(typewriterPush_snd, 1, false);
		switch (cursorPos)
		{
			case 0:
			break;
			case 1:
			break;
			case 2:
			break;
			case 3:
				if (window_get_fullscreen()) {
					window_set_fullscreen(false);
					window_set_size(xScreenSize*3, yScreenSize*3);
					surface_resize(application_surface, xScreenSize, yScreenSize);
					display_set_gui_size(xScreenSize, yScreenSize);
				} else {
					window_set_fullscreen(true);
				}
			break;
			case 4:
				room_goto(mainmenu);
			break;
		}
		saveSettings_scr();
	}
}

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2)) {
	audio_play_sound(typewriterPush_snd, 1, false);
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