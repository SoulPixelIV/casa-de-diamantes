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
			global.lastCheckpoint = noone;
		break;
		case 1:
			room_goto(level1);
			global.lastCheckpoint = noone;
		break;
		case 2:
			room_goto(level2);
			global.lastCheckpoint = noone;
		break;
		case 3:
			room_goto(level3);
			global.lastCheckpoint = noone;
		break;
		case 4:
			room_goto(level_Casino);
			global.lastCheckpoint = noone;
		break;
		case 5:
			room_goto(level4);
			global.lastCheckpoint = noone;
		break;
		case 6:
			room_goto(level5A);
			global.lastCheckpoint = noone;
		break;
		case 7:
			room_goto(level0_Powerplant);
			global.lastCheckpoint = noone;
		break;
		case 8:
			room_goto(level1_Powerplant);
			global.lastCheckpoint = noone;
		break;
		case 9:
			room_goto(level2_Powerplant);
			global.lastCheckpoint = noone;
		break;
		case 10:
			room_goto(level3_Powerplant);
			global.lastCheckpoint = noone;
		break;
		case 11:
			room_goto(level0_DarkSewers);
			global.lastCheckpoint = noone;
		break;
		case 12:
			room_goto(enemyTestRoom1);
			global.lastCheckpoint = noone;
		break;
	}
}
