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
			room_goto(level0_RoadToCasino);
		break;
		case 1:
			room_goto(level1_RoadToCasino);
		break;
		case 2:
			room_goto(level_Casino);
		break;
		case 3:
			room_goto(level0_SenzelaForest);
		break;
		case 4:
			room_goto(level1_SenzelaForest);
		break;
		case 5:
			room_goto(level2_SenzelaForest);
		break;
		case 6:
			room_goto(level3_SenzelaForest);
		break;
		case 7:
			room_goto(level0_Powerplant);
		break;
		case 8:
			room_goto(level1_Powerplant);
		break;
		case 9:
			room_goto(level2_Powerplant);
		break;
		case 10:
			room_goto(level3_Powerplant);
		break;
		case 11:
			room_goto(level0_DarkSewers);
		break;
		case 12:
			room_goto(enemyTestRoom1);
		break;
	}
}
