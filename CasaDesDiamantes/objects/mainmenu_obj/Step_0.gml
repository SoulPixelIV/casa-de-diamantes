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
			room_goto(level0);
		break;
		case 1:
			room_goto(levelSelect);
		break;
		case 2:
		break;
		case 3:
			game_end();
		break;
	}
}

if (titleAlpha < 1) {
	titleAlpha += global.dt / 200;
}