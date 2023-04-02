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
				url_open("https://store.steampowered.com/app/1814890/Casa_De_Diamantes/");
			break;
			case 1:
				room_goto(level_Casino);
			break;
			case 2:
				room_goto(mainmenu);
			break;
		}
	}
