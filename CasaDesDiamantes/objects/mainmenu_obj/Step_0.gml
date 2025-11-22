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
				if (hitbox.index < 5) {
					cursorPos = hitbox.index;
				
					if (mouse_check_button_pressed(mb_left)) {
						audio_play_sound(typewriterPush_snd, 1, false);
						
						switch (cursorPos)
						{
							case 0:
								ini_open("save1");
	
								var rm_name = ini_read_string("save1", "room", "level0");
	
								// erzwinge string
								rm_name = string(rm_name);
	
								// Jetzt den Raum holen
								var rm_index = asset_get_index(rm_name);
	
								// wenn ungültig → fallback
								if (rm_index < 0 || !room_exists(rm_index)) {
								    drawWarningMenu = true;
								} else {
									if (file_exists("save1")) {
										load_scr();
									} else {
										drawWarningMenu = true;
									}
								}
								
								ini_close();								
							break;
							case 1:
								buttonBufferStart = true;
								drawStartMenu = true;
							break;
							case 2:
								room_goto(levelSelect);		
							break;
							case 3:
								room_goto(settings);
							break;
							case 4:
								game_end();
							break;
						}
					}
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

	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
	{
		audio_play_sound(typewriterPush_snd, 1, false);
		switch (cursorPos)
		{
			case 0:
				ini_open("save1");
	
				var rm_name = ini_read_string("save1", "room", "level0");
	
				// erzwinge string
				rm_name = string(rm_name);
	
				// Jetzt den Raum holen
				var rm_index = asset_get_index(rm_name);
	
				// wenn ungültig → fallback
				if (rm_index < 0 || !room_exists(rm_index)) {
					drawWarningMenu = true;
				} else {
					if (file_exists("save1")) {
						load_scr();
					} else {
						drawWarningMenu = true;
					}
				}
								
				ini_close();
			break;
			case 1:
				buttonBufferStart = true;
				drawStartMenu = true;
			break;
			case 2:
				room_goto(levelSelect);
			break;
			case 3:
				room_goto(settings);
			break;
			case 4:
				game_end();
			break;
		}
	}
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