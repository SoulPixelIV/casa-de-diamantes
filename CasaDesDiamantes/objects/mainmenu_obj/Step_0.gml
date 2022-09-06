if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
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
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
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

if (keyboard_check_pressed(vk_enter))
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
