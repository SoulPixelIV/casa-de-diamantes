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
							if steam_initialised() {
								steam_activate_overlay_browser("https://store.steampowered.com/app/1814890/Casa_De_Diamantes/");
							}

							//url_open("https://store.steampowered.com/app/1814890/Casa_De_Diamantes/");
						break;
						case 1:
							room_goto(level_Casino);
						break;
						case 2:
							room_goto(mainmenu);
						break;
					}
				}
			}
		}
	}
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
	{
		if (cursorPos > 0)
		{
			cursorPos--;
		}
		else
		{
			cursorPos = 2;
		}
	}
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd))
	{
		if (cursorPos < 2)
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
				if steam_initialised() {
					steam_activate_overlay_browser("https://store.steampowered.com/app/1814890/Casa_De_Diamantes/");
				}

				//url_open("https://store.steampowered.com/app/1814890/Casa_De_Diamantes/");
			break;
			case 1:
				room_goto(level_Casino);
			break;
			case 2:
				room_goto(mainmenu);
			break;
		}
	}
