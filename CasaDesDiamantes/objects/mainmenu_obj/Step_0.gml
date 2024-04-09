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
					switch (cursorPos)
					{
						case 0:
							if (file_exists("save1")) {
								load_scr();
								room_goto(global.room);
							}
						break;
						case 1:
							buttonBufferStart = true;
							drawStartMenu = true;
						break;
						case 2:
							room_goto(settings);
						break;
						case 3:
							game_end();
						break;
					}
				}
			}
		}
	}
}

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

	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
	{
		switch (cursorPos)
		{
			case 0:
				if (file_exists("save1")) {
					load_scr();
					room_goto(global.room);
				}
			break;
			case 1:
				buttonBufferStart = true;
				drawStartMenu = true;
			break;
			case 2:
				room_goto(settings);
			break;
			case 3:
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